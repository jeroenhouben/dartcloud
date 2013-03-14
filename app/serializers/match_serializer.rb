class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  has_many :legs, embed: :objects

end
