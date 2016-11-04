require_relative "container"

module Streakist
  Import = Streakist::Container.injector

  auto_inject = Dry::AutoInject(Streakist::Container)

  HashImport = -> *keys do
    keys.each do |key|
      unless Streakist::Container.key?(key)
        Streakist::Container.load_component(key)
      end
    end

    auto_inject.hash[*keys]
  end

  def self.Import(*args)
    Import[*args]
  end
end
