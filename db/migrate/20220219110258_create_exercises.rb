class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :description
      t.string :technique
      t.integer :sets
      t.integer :repetitions
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
