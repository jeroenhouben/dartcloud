class LegSerializer < ActiveModel::Serializer

  attributes :id, :match_id, :winner_id

  has_one :match, :embed => :ids, :include => true
  has_one :winner, :embed => :ids, :include => true
  has_many :leg_players, :embed => :ids, :include => true

  def include_associations!
    include! :match unless object.shallow_serialize
    include! :leg_players  unless object.shallow_serialize
    # include! :winner unless object.shallow_serialize
  end 
  

end
