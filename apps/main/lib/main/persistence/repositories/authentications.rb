require "streakist/repository"
require "main/entities/authentication"

module Main
  module Persistence
    module Repositories
      class Authentications < Streakist::Repository[:authentications]
        def [](id)
          authentications.by_id(id).as(Entities::Authentication).one!
        end
      end
    end
  end
end
