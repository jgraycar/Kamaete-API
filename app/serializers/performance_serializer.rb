class PerformanceSerializer < ActiveModel::Serializer
  attributes :id, :title, :date
  has_many :members, serializer: MemberSerializer
  has_many :stage_layouts, serializer: StageLayoutSerializer
end
