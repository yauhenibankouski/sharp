class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainings
  has_many :exercises
  has_many :bookings
  has_many :shared_exercises
  has_many :training_plans, through: :trainings

  def available_trainings(used_trainings)
    trainings.select do |training|
      available_training?(used_trainings, training)
    end
  end

  def available_exercises(used_exercises)
    exercises.select do |exercise|
      available_exercise?(used_exercises, exercise)
    end
  end

  def available_training?(used_trainings, training)
    used_trainings.select do |tr|
      return false if tr == training
    end
    true
  end

  def available_exercise?(used_exercises, exercise)
    used_exercises.select do |ex|
      return false if ex.exercise_id == exercise.id
    end
    true
  end
end
