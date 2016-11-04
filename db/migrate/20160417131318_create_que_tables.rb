ROM::SQL.migration do
  change do
    Streakist::Container.boot! :que
    Que.migrate!
  end
end
