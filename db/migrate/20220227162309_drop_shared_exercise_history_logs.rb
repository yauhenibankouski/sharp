class DropSharedExerciseHistoryLogs < ActiveRecord::Migration[6.1]
  def change
    drop_table :shared_exercise_history_logs
  end
end
