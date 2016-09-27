class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :stage_layout, optional: true
  belongs_to :member, optional: true

  enum shape: {
    ellipse: 0,
    cross: 1,
    triangle: 2,
    rectangle: 3,
  }

  def create_instance
    return unless self.template?
    Instrument.create(
      shape: self.shape, width: self.width, height: self.height,
      kind: self.kind, angle: self.angle, color: self.color,
      user: self.user)
  end
end
