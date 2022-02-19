class ChangeStringForTechnique < ActiveRecord::Migration[6.1]
  def change
    change_column(:exercises, :technique, :text)
  end
end
