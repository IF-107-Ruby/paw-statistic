module GithubApi
  module Models
    class User
      attr_reader :user_id, :login

      def initialize(json:)
        @json = json
        @user_id = json['id']
        @login = json['login']
      end

      def as_json
        { user_id: user_id, login: login }
      end
    end
  end
end
