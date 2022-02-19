class SharedTrainingPlan < ApplicationRecord
  belongs_to :training
  belongs_to :shared_exercise
  belongs_to :booking
end
