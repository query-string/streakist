require "dry/web/settings"
require "dry-types"

module Streakist
  class Settings < Dry::Web::Settings
    module Types
      include Dry::Types.module

      module Required
        String = Types::Strict::String.constrained(min_size: 1)
      end
    end

    setting :database_url, Types::Required::String
    setting :session_secret, Types::Required::String

    setting :assets_server_url, Types::Required::String
    setting :precompiled_assets, Types::Form::Bool.default(false)
    setting :precompiled_assets_host

    setting :app_mailer_from_email, Types::String

    setting :bugsnag_api_key, Types::String
    setting :postmark_api_key, Types::String
    setting :todoist_client_id, Types::String
    setting :todoist_client_secret, Types::String
  end
end
