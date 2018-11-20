class AddColumnsToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :client_note, :text
    add_column :bookings, :user_note, :text
  end
end
