class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_signature

  def receive
    HandleEventJob.perform_later event_type, payload
    render json: { received: true }, status: :ok
  end

  private

  def verify_signature
    return unless compare_signatures

    render 'Invalid signature', status: :unauthorized
  end

  def compare_signatures
    Rack::Utils
      .secure_compare(signature, request.headers['X-Hub-Signature'])
  end

  def signature
    'sha1=' + OpenSSL::HMAC.hexdigest(
      OpenSSL::Digest.new('sha1'),
      ENV['SECRET_TOKEN'],
      parse_data['payload']
    )
  end

  def payload
    Oj.load(parse_data['payload']).deep_symbolize_keys
  end

  def event_type
    request.headers['X-Github-Event']
  end

  def parse_data
    if request.headers['Content-Type'] == 'application/json'
      JSON.parse(request.body.read)
    else
      params.as_json
    end
  end
end
