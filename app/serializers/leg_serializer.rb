class LegSerializer < ActiveModel::Serializer

  attributes :id, :match_id, :winner_id

  has_many :leg_players, embed: :objects

end
