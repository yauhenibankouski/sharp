class Message < ApplicationRecord
  belongs_to :shared_exercise
  belongs_to :user
end
