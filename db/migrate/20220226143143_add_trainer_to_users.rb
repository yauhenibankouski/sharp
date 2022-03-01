class AddTrainerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :trainer, :boolean, default: false
  end
end
