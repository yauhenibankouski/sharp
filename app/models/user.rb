class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainings, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :shared_exercises, dependent: :destroy
  has_many :training_plans, through: :trainings


  def my_trainer?(trainer)
    Booking.find_by(user_id: trainer.id, client_id: id) ? true : false
  end

  def my_bookings
    Booking.find_by(client_id: id)
  end

  def available_trainings(used_trainings)
    trainings.select do |training|
      available_training?(used_trainings, training)
    end
  end

  def available_training?(used_trainings, training)
    used_trainings.select do |tr|
      return false if tr == training
    end
    true
  end

end
