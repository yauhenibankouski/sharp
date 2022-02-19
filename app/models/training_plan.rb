class TrainingPlan < ApplicationRecord
  belongs_to :exercise
  belongs_to :training

  #Validations
  validates :title, presence: true
end
