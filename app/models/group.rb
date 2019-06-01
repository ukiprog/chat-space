class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :members

  validates :name, presence: true
  validates :name, uniquences: true
end
