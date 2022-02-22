class RemoveClientFromBooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :client_id, :bigint
  end
end
