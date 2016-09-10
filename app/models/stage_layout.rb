class StageLayout < ApplicationRecord
  has_many :instruments
  belongs_to :performance, optional: true
  belongs_to :user

  validates :name, presence: true
end
