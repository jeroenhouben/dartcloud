class TurnSerializer < ActiveModel::Serializer
  attributes :id, :dart1, :dart2, :dart3, :simple_score, :completed

  has_one :player
  has_one :leg

  def id
    object._id
  end 

end
