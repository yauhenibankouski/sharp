class SharedTrainingPlan < ApplicationRecord
  belongs_to :training
  belongs_to :shared_exercise
  belongs_to :booking

  validates :training, presence: true
  validates :booking, presence: true
  validates :shared_exercise, presence: true, uniqueness: { scope: :training }
end
