class ChangeCategoryToActivity < ActiveRecord::Migration[6.1]
  def change
    rename_column :trainings, :category, :activity
  end
end
