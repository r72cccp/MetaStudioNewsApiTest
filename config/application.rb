# frozen_string_literal: true

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
require 'action_cable/engine'
require 'rails/test_unit/railtie'

# Require 'he gems listed in Gemfile, including any gem'
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewsApi
  class Application < Rails::Application
    require 'dotenv'
    Dotenv.load('config/.env.local')

    config.api_only = true
    config.middleware.use Rack::Attack
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.debug_exception_response_format = :api
    config.load_defaults 6.0
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post options]
      end
    end
  end
end
