require "dry/matcher/either_matcher"
require "dry-monads"
require "main/import"
require "main/validation/authentication_params_schema"

module Main
  module Operations
    module Authentications
      class Create
        include Main::Import["main.persistence.repositories.authentications"]
        include Dry::Monads::Either::Mixin
        include Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)

        def call(authentication)
          validation = Main::Validation::AuthenticationParamsSchema.(uid: authentication.uid.to_i, token: authentication.credentials["token"])

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
