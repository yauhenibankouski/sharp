class AddTechniqueToSharedExercises < ActiveRecord::Migration[6.1]
  def change
    add_column :shared_exercises, :technique, :text
  end
end
