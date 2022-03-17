class Exercise < ApplicationRecord
  belongs_to :user
  has_many :training_plans
  has_one_attached :photo

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :technique, presence: true
  validates :sets, presence: true, numericality: { less_than_or_equal_to: 100,  only_integer: true }
  validates :repetitions, presence: true, numericality: { less_than_or_equal_to: 100,  only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: [ :title, :description ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
