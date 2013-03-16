class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  embed :ids, :include => true
  
  has_many :legs
  has_many :players

  def include_associations!
    include! :legs unless object.shallow_serialize
    include! :players unless object.shallow_serialize
  end  

end
