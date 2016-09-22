class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :members
  has_many :performances
  has_many :stage_layouts
  has_many :instrument_types

  # Returns Stage Layouts created by this user that are intended to
  # act as templates for future layouts.
  def stage_layout_templates
    StageLayout.where(user: self, performance: nil)
  end

  # Returns Instruments created by this user that are intended to
  # act as templates for future instruments.
  def instrument_templates
    Instrument.where(user: self, template: true)
  end
end
