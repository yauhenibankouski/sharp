class AddClientToBooking < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :client, null: false, foreign_key: { to_table: :users }
  end
end
