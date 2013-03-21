class Turn
  include Mongoid::Document
  field :dart1, type: Integer
  field :dart2, type: Integer
  field :dart3, type: Integer
  field :simple_score, type: Integer
  field :completed, type: Boolean

  belongs_to :leg
  belongs_to :player

end
