class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  embed :ids, :include => true
  
  has_many :legs
  has_many :players

  def include_associations!
    include! :legs if object.serialize_associations
    include! :players if object.serialize_associations
  end  

end
