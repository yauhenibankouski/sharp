class CreateSharedTrainingPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_training_plans do |t|
      t.references :training, null: false, foreign_key: true
      t.references :shared_exercise, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
