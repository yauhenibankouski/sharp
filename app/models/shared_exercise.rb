class SharedExercise < ApplicationRecord
  has_many :shared_training_plans
  has_many :history_logs
  has_one_attached :photo
  has_many :messages
  belongs_to :user
  validates :user, presence: true
  validates :exercise, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :sets, presence: true, numericality: { only_integer: true }
  validates :repetitions, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: [ :title, :description ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
