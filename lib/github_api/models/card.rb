module GithubApi
  module Models
    class Card
      attr_reader :card_id, :note, :archived

      def initialize(json:)
        @json = json
        @card_id = json['id']
        @note = json['note']
        @archived = json['archived']
      end

      def creator
        @creator ||= User.new json: @json['creator']
      end

      def content
        unless @json['content_url'].nil?
          @content ||= Issue.new json: GithubApi.client.request(
            http_method: :get,
            endpoint: @json['content_url']
          )
        end
        @content
      end

      def as_json
        { card_id: card_id, note: note, archived: archived }
      end
    end
  end
end
