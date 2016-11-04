require "streakist/email"
require "main/container"

module Main
  class Email < Streakist::Email
    configure do |config|
      config.root = Container.root.join("emails")
      config.name = "email"
    end
  end
end
