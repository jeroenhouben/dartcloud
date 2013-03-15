class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  has_many :legs, embed: :objects
  has_many :players, embed: :objects

end
