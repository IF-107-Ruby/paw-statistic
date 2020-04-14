module GithubApi
  module Models
    class Issue
      attr_reader :issue_id, :title, :number, :state, :locked

      def initialize(json:)
        @json = json
        @issue_id = json['id']
        @title = json['title']
        @number = json['number']
        @state = json['state']
        @locked = json['locked']
      end

      def user
        @user ||= User.new json: @json['user']
      end

      def as_json
        { issue_id: issue_id, title: title, state: state, locked: locked, number: number }
      end
    end
  end
end
