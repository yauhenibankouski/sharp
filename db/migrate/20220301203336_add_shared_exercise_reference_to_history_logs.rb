class AddSharedExerciseReferenceToHistoryLogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :history_logs, :shared_exercise, null: false, foreign_key: true
  end
end
