require "dry/web/container"
require "dry/web/umbrella"
require_relative "settings"

module Streakist
  class Container < Dry::Web::Umbrella
    configure do |config|
      config.name = :core
      config.settings_loader = Streakist::Settings
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "system"

    def self.settings
      config.settings
    end
  end
end
