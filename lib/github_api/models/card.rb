module GithubApi
  module Models
    class Card
      attr_reader :id, :note, :archived

      def initialize(json:)
        @json = json
        @id = json['id']
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
    end
  end
end
