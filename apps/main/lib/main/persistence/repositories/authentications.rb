require "streakist/repository"
require "main/entities/authentication"

module Main
  module Persistence
    module Repositories
      class Authentications < Streakist::Repository[:authentications]
        commands :create, update: [:by_id]

        def [](id)
          authentications.by_id(id).as(Entities::Authentication).one!
        end
      end
    end
  end
end
