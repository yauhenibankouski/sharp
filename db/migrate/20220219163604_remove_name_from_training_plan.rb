class RemoveNameFromTrainingPlan < ActiveRecord::Migration[6.1]
  def change
    remove_column :training_plans, :name, :string
  end
end
