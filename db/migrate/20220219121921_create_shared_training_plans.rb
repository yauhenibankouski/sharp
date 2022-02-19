class CreateSharedTrainingPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_training_plans do |t|
      t.reference :Training
      t.reference :Shared_Exercise
      t.reference :Booking

      t.timestamps
    end
  end
end
