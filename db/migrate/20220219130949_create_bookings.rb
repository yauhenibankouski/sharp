class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :client_id
      t.string :status

      t.timestamps
    end
  end
end
