class CreateTrainingPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :training_plans do |t|
      t.string :name
      t.references :exercise, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
