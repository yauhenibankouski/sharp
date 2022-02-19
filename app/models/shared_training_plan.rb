class SharedTrainingPlan < ApplicationRecord
  belongs_to :Training
  belongs_to :Shared_Exercise
  belongs_to :Booking
end
