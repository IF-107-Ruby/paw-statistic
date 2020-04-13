module GithubApi
  module Models
    class Column
      attr_reader :id, :name

      def initialize(json:)
        @json = json
        @id = json['id']
        @name = json['name']
      end

      def cards
        @cards ||= GithubApi.client.request(
          http_method: :get,
          endpoint: @json['cards_url']
        ).map { |raw_json| Card.new json: raw_json }
      end
    end
  end
end
