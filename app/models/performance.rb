class Performance < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :members
  has_many :stage_layouts

  validates :title, presence: true
  validates :date, presence: true
end
