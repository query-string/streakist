module TestHelpers
  module_function

  def container
    Streakist::Container
  end

  def app
    Streakist::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
