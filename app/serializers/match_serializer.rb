class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  def id
    object._id
  end 

end
