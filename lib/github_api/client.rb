module GithubApi
  class << self
    def client
      @_client
    end

    def client=(client)
      @_client = client
    end
  end

  class Client
    API_ENDPOINT = 'https://api.github.com'.freeze

    attr_reader :oauth_token

    def initialize(oauth_token = nil)
      @oauth_token = oauth_token
    end

    def repo_projects(username, repo)
      request(
        http_method: :get,
        endpoint: "#{API_ENDPOINT}/repos/#{username}/#{repo}/projects"
      ).map { |raw_json| Models::Project.new json: raw_json }
    end

    def project_columns(project_id)
      request(
        http_method: :get,
        endpoint: "#{API_ENDPOINT}/projects/#{project_id}/columns"
      ).map { |raw_json| Models::Column.new json: raw_json }
    end

    def column_cards(column_id)
      request(
        http_method: :get,
        endpoint: "#{API_ENDPOINT}/projects/columns/#{column_id}/cards"
      ).map { |raw_json| Models::Card.new json: raw_json }
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      Oj.load(response.body)
    end

    private

    def client
      @client ||= Faraday.new do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
        if oauth_token.present?
          client.headers['Accept'] = 'application/vnd.github.inertia-preview+json'
          client.headers['Authorization'] = "token #{oauth_token}"
        end
      end
    end
  end
end
