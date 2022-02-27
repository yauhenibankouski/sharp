class CreateHistoryLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :history_logs do |t|
      t.text :notes

      t.timestamps
    end
  end
end
