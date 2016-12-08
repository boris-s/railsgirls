class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :username

  # Vazby na idea a comment + co s nimi po user.destroy
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
end
