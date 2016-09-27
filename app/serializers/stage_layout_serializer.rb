class StageLayoutSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :instruments, serializer: InstrumentSerializer
end
