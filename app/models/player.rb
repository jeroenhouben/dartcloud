class Player
  include Mongoid::Document
  field :name, type: String

  embedded_in :leg

end
