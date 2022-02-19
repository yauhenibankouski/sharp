class SharedExercise < ApplicationRecord
  belongs_to :user
  has_many :shared_training_plans
end
