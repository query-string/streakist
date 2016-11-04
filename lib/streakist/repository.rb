require "rom-repository"
require "streakist/container"
require "streakist/import"

Streakist::Container.boot! :rom

module Streakist
  class Repository < ROM::Repository::Root
    include Streakist::Import.args["persistence.rom"]
  end
end
