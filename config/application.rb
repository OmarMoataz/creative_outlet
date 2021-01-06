# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CreativeOutlet
  # Configurations for Rails app.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.api_only = true

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins Rails.application.credentials[Rails.env.to_sym][:allowed_origins]
    #     resource '*',
    #               headers: :any,
    #               expose: %w[access-token expiry token-type uid client],
    #               methods: %i[get post options delete put]
    #   end
    # end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
