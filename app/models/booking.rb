class Booking < ApplicationRecord
  belongs_to :user
  has_many :shared_training_plans

  validates :user, presence: true
  validates :client_id, presence: true, uniqueness: { scope: :user } # Unique client-trainer pair
  validates :status, presence: true
end
