class DropSharedExerciseHistories < ActiveRecord::Migration[6.1]
  def change
    drop_table :shared_exercise_histories
  end
end
