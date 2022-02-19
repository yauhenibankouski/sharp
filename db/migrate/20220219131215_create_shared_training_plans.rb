class CreateSharedTrainingPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_training_plans do |t|
      t.references :Training, null: false, foreign_key: true
      t.references :Shared_Exercise, null: false, foreign_key: true
      t.references :Booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
