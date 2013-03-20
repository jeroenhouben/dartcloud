class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name

  def id
    object._id
  end 

end
