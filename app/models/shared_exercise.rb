class SharedExercise < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  has_many :shared_training_plans
  has_many :history_logs
  has_one_attached :photo
  has_many :messages
  validates :user, presence: true
  validates :exercise, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :sets, presence: true, numericality: { only_integer: true }
  validates :repetitions, presence: true, numericality: { only_integer: true }
end
