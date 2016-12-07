ROM::SQL.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :email, null: false, unique: true
      String :full_name, null: true
      String :image_id, null: true
      Integer :karma, null: false
      column :created_at, DateTime, null: false, default: Sequel.lit("(now() at time zone 'utc')")
    end
  end
end
