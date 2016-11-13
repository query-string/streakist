require "dry-validation"

module Main
  module Validation
    AuthenticationParamsSchema = Dry::Validation.Schema do

      configure do
        config.messages = :i18n
        option :authentication_token_uniqueness_check, Main::Container["main.persistence.authentication_token_uniqueness_check"]

        def token_unique?(value)
          authentication_token_uniqueness_check.(value)
        end
      end

      required(:uid) { filled? & int? }
      required(:token) { filled? & str? & token_unique? }
    end
  end
end
