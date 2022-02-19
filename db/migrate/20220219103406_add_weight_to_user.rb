class AddWeightToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :weight, :float
  end
end
