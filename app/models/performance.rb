class Performance < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :members

  validates :title, presence: true
  validates :date, presence: true
end
