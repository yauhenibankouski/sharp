class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :description
      t.string :technique
      t.integer :sets
      t.integer :repetitions
      t.reference :user

      t.timestamps
    end
  end
end
