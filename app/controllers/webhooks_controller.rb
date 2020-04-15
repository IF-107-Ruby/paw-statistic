class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    case params[:integration_name]
    when 'github'
      handle_github_event
    end
    render json: { received: true }, status: :ok
  end

  private

  def handle_github_event
    payload = JSON.parse(parse_data['payload'])
    case request.headers['X-Github-Event']
    when 'project'
      HandleProjectEventJob.perform_later payload
    when 'project_column'
      HandleProjectColumnEventJob.perform_later payload
    when 'project_card'
      HandleProjectCardEventJob.perform_later payload
    end
  end

  def parse_data
    if request.headers['Content-Type'] == 'application/json'
      JSON.parse(request.body.read)
    else
      params.as_json
    end
  end
end
