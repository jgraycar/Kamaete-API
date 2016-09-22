class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :stage_layout, optional: true
  belongs_to :member, optional: true

  enum shape: {
    circle: 0,
    square: 1,
    cross: 2,
    triangle: 3,
    rectangle: 4,
  }

  def create_instance
    return unless self.template?
    Instrument.create(
      shape: self.shape, size: self.size, kind: self.kind,
      angle: self.angle, color: self.color, user: self.user)
  end
end
