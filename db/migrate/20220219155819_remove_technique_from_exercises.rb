class RemoveTechniqueFromExercises < ActiveRecord::Migration[6.1]
  def change
    remove_column :exercises, :technique
  end
end
