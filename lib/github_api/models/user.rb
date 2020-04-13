module GithubApi
  module Models
    class User
      attr_reader :id, :login

      def initialize(json:)
        @json = json
        @id = json['id']
        @login = json['login']
      end
    end
  end
end
