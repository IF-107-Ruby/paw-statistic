require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module PawStatistics
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.eager_load_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('/app/concerns')

    config.after_initialize do
      unless Rails.env.test? || ActiveRecord::Base
             .connection.migration_context.needs_migration?
        loader = ProjectsLoader.new(
          github_login: ENV['GITHUB_LOGIN'],
          github_repo: ENV['GITHUB_REPO']
        )
        loader.load
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.generators.template_engine :slim
  end
end
