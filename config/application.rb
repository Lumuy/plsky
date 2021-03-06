require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Plsky
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = "Beijing"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Rails 5中在生产环境下autoload_paths并不会自动加载，需要下面的配置重新启用
    config.enable_dependency_loading = true

    config.autoload_paths += %W[#{Rails.root}/lib]

    config.i18n.default_locale = :"zh-CN"

    config.generators do |generator|
      generator.assets false
      generator.test_framework :rspec
      generator.skip_routes true
    end
  end
end
