class CreateSharedExerciseHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_exercise_histories do |t|
      t.text :notes
      t.timestamps
    end
  end
end
