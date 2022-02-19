class Exercise < ApplicationRecord
  belongs_to :user
  has_many :training_plans

  #Validations
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :technique, presence: true, length: { maximum: 500 }
  validates :sets, presence: true, numericality: { less_than_or_equal_to: 100,  only_integer: true }
  validates :repetitions, presence: true, numericality: { less_than_or_equal_to: 100,  only_integer: true }
end
