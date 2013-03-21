class MatchSerializer < ActiveModel::Serializer
  attributes :id, :start_score

  has_many :players
  has_many :legs

  def id
    object._id
  end 

end
