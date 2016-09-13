class Instrument < ApplicationRecord
  belongs_to :stage_layout
  belongs_to :member, optional: true
end
