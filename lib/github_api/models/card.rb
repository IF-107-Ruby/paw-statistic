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
        if @json['creator']['type'] == 'User'
          @creator ||= User.new json: @json['creator']
        else
          @json['creator']
        end
      end

      def as_json
        { card_id: card_id, note: note, archived: archived }
      end
    end
  end
end
