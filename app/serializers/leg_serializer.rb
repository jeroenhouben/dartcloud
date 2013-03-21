class LegSerializer < ActiveModel::Serializer
  attributes :id

  # has_many :players
  # has_many :turns

  def id
    object._id
  end 

end
