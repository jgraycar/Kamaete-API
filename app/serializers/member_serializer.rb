class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :performances, serializer: PerformanceSerializer
end
