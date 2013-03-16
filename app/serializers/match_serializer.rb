class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  has_many :legs, embed: :ids
  has_many :players, embed: :ids

  def include_associations!
    include! :legs if object.serialize_associations
    include! :players if object.serialize_associations
  end  

end
