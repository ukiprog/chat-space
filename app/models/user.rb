class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, through: :members
  has_many :members
  has_many :messages

  validates :name, presence: true, length: { maximum: 6 }
  validates :email, presence: true
  validates :email, presence: true, length: { minimum: 6 }
end
