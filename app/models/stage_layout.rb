class StageLayout < ApplicationRecord
  has_many :instruments
  belongs_to :performance

  validates :name, presence: true
end
