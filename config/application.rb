require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trainingap
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir["#{config.root}/app/forms/**/"]
    config.autoload_paths += Dir["#{config.root}/app/queries/**/"]
    config.autoload_paths += Dir["#{config.root}/app/services/**/*.rb"]
    config.autoload_paths += Dir["#{config.root}/app/policy/**/"]

    config.i18n.default_locale = :vi
    config.i18n.fallbacks = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*','**/*.{rb,yml}').to_s]

    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.serve_static_assets = true
    config.assets.js_compressor = :uglifier
    config.assets.compile = true
    config.assets.digest = true
    config.assets.version = '1.0'
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
  end
end
