require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CoyellPortfolio
  class Application < Rails::Application
    # デフォルトの時間軸を日本に設定する
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    
    # デフォルトの言語を日本語に設定する
    config.i18n.default_locale = :ja
    # 複数のロケールファイルのパスを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
