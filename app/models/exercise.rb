class Exercise < ApplicationRecord
  belongs_to :user
  has_many :training_plans
end
