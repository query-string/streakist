ROM::SQL.migration do
  change do
    create_table(:authentications) do
      primary_key :id
      String :provider, null: false, default: "todoist"
      Integer :uid, null: false
      String :token, null: false, unique: true
      column :created_at, DateTime, null: false, default: Sequel.lit("(now() at time zone 'utc')")
    end
  end
end
