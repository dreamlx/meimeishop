require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Meimeishop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.available_locales = ['zh-CN', :en]
    config.i18n.default_locale = :'zh-CN'
    config.time_zone = 'Beijing'
    # config.assets.compile = true
    # config.serve_static_assets = true
    # config.public_file_server.enabled = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
