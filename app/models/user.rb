class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainings, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :shared_exercises, dependent: :destroy
end
