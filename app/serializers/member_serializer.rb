class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :performances
end
