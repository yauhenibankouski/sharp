class Training < ApplicationRecord
  belongs_to :user
  has_many :training_plans
  has_many :exercises, through: :training_plans
  has_many :shared_training_plans

  #Validations
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :activity, presence: true, length: { maximum: 80 }
end
