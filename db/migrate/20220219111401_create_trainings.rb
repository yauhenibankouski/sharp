class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
