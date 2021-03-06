class Training < ApplicationRecord
  belongs_to :user
  has_many :training_plans
  has_many :exercises, through: :training_plans
  has_many :shared_training_plans
  has_many :shared_exercises, through: :shared_training_plans
  has_one_attached :photo

  #Validations
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :activity, presence: true, length: { maximum: 80 }

  def client_exercises(booking)
    SharedTrainingPlan.where(booking: booking, training: self).map(&:shared_exercise)
  end
end
