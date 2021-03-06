class Booking < ApplicationRecord
  belongs_to :user
  has_many :shared_training_plans
  has_many :shared_exercises, through: :shared_training_plans
  belongs_to :client, class_name: 'User', foreign_key: "client_id"

  validates :user, presence: true, uniqueness: { scope: :client_id }
  validates :client, presence: true
  validates :status, presence: true
end
