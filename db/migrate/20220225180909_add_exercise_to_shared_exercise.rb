class AddExerciseToSharedExercise < ActiveRecord::Migration[6.1]
  def change
    add_reference :shared_exercises, :exercise, null: false, foreign_key: true
  end
end
