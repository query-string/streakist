require "main/persistence/uniqueness_check"

Main::Container.namespace "main.persistence" do |container|
  container.register "authentication_token_uniqueness_check" do
    Main::Persistence::UniquenessCheck.new(container["core.persistence.rom"].relation(:authentications), :token)
  end
end
