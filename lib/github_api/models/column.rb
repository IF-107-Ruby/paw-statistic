module GithubApi
  module Models
    class Column
      attr_reader :column_id, :name

      def initialize(json:)
        @json = json
        @column_id = json['id']
        @name = json['name']
      end

      def cards
        @cards ||= GithubApi.client.request(
          http_method: :get,
          endpoint: @json['cards_url']
        ).map { |raw_json| Card.new json: raw_json }
      end

      def as_json
        { column_id: column_id, name: name }
      end
    end
  end
end
