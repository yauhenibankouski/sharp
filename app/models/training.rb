class Training < ApplicationRecord
  belongs_to :user
  has_many :training_plans
  has_many :shared_training_plans
end
