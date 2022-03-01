class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :shared_training_plan
  belongs_to :booking
end
