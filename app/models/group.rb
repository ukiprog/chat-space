class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :members
  has_many :messages

  validates :name, presence: true
  validates :name, uniqueness: true
end
