module GithubApi
  module Models
    class Project
      attr_reader :project_id, :name, :body, :state, :number

      def initialize(json:)
        @json = json
        @project_id = json['id']
        @name = json['name']
        @body = json['body']
        @state = json['state']
        @number = json['number']
      end

      def columns
        @columns ||= GithubApi.client.request(
          http_method: :get,
          endpoint: @json['columns_url']
        ).map { |raw_json| Column.new json: raw_json }
      end

      def creator
        @creator ||= User.new json: @json['creator']
      end

      def as_json
        { project_id: project_id, name: name,
          body: body, state: state, number: number }
      end
    end
  end
end
