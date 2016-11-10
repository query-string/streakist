require "dry-monads"
require "main/import"
require "main/validation/authentication_params_schema"

module Main
  module Operations
    module Authentications
      class Create
        include Main::Import["main.persistence.repositories.authentications"]
        include Dry::Monads::Either::Mixin

        def call(authentication)
          validation = Main::Validation::AuthenticationParamsSchema.(uid: authentication.uid, token: authentication.credentials["token"])
          if validation.success?
            authentication = authentications.create(validation.output)
            Right(authentication)
          else
            Left(validation.messages)
          end
        end
      end
    end
  end
end
