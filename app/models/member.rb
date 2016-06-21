class Member < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :performances

  validates :name, presence: true
end
