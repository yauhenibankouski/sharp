class SharedExercise < ApplicationRecord
  belongs_to :user
  has_many :shared_training_plans

  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :sets, presence: true, numericality: { only_integer: true }
  validates :repetitions, presence: true, numericality: { only_integer: true }
end
