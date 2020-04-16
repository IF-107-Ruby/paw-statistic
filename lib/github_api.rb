module GithubApi
  class << self
    def get(endpoint:, params: {})
      response = client.public_send(:get, endpoint, params)
      json = Oj.load(response.body)
      if json.is_a? Array
        json.map(&:deep_symbolize_keys)
      else
        json.deep_symbolize_keys
      end
    end

    private

    def client
      @client ||= Faraday.new do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
        client.headers['Accept'] = 'application/vnd.github.inertia-preview+json'
        client.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN']}"
      end
    end
  end
end
