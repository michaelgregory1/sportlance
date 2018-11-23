class AddPaymentInfoToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :state, :string
    add_column :bookings, :payment, :jsonb
    add_monetize :bookings, :amount, currency: { present: false }
  end
end
