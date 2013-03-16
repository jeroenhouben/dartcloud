class LegSerializer < ActiveModel::Serializer

  attributes :id, :match_id, :winner_id

  embed :ids, :include => true

  has_one :match
  has_one :winner
  has_many :leg_players

  def include_associations!
    include! :leg_players if (object.serialize_associations || object.match.serialize_associations)
    include! :match if object.serialize_associations
    include! :winner if (object.serialize_associations || object.match.serialize_associations)
  end 
  

end
