class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sport, :string
    add_column :users, :price_per_hour, :integer
    add_column :users, :abilities_taught, :string
    add_column :users, :bio, :text
    add_column :users, :photo, :string
    add_column :users, :is_client, :boolean
    add_column :users, :rating, :float
  end
end
