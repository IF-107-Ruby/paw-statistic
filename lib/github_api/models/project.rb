module GithubApi
  module Models
    class Project
      attr_reader :id, :name, :body, :state

      def initialize(json:)
        @json = json
        @id = json['id']
        @name = json['name']
        @body = json['body']
        @state = json['state']
      end

      def columns
        @columns ||= GithubApi.client.request(
          http_method: :get,
          endpoint: @json['columns_url']
        ).map { |raw_json| Column.new json: raw_json }
      end

      def creator
        if @json['creator']['type'] == 'User'
          @creator ||= User.new json: @json['creator']
        else
          @json['creator']
        end
      end
    end
  end
end
