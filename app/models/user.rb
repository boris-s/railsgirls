class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
  attr_accessor :login
  validates :username, presence: true,
            uniqueness: { case_insensitive: false }

  # Vazby na idea a comment + co s nimi po user.destroy
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    if login = conditions.delete( :login )
      where( conditions )
        .where( ["lower(username) = :value OR lower(email) = :value",
                 { value: login.downcase }] )
        .first
    else
      if conditions[:username].nil?
        where( conditions ).first
      else
        where( username: conditions[:username] ).first
      end
    end
  end
end
