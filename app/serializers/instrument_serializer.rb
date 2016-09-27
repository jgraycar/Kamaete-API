class InstrumentSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :label, :color, :angle,
    :kind, :shape, :width, :height, :template
  belongs_to :member, serializer: MemberSerializer
  belongs_to :stage_layout, serializer: StageLayoutSerializer
end
