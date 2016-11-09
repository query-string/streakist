require "main/import"
require "dry/matcher/either_matcher"
require "dry-monads"

module Main
  module Operations
    module Authentications
      class Create
        include Main::Import["main.persistence.repositories.authentications"]
        include Dry::Monads::Either::Mixin
        include Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)

        def call(authentication)
          authentications.create(uid: authentication.uid.to_i, token: authentication.credentials["token"])
        end
      end
    end
  end
end
