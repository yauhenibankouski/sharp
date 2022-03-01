class HistoryLog < ApplicationRecord
  has_one_attached :photo
  belongs_to :shared_exercise
end
