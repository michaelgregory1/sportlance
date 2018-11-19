class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.datetime :date_start
      t.datetime :date_end
      t.references :location, foreign_key: true
      t.integer :price
      t.boolean :confirmed
      t.references :client, index: true, foreign_key:{ to_table: :users }
      t.timestamps
    end
  end
end
