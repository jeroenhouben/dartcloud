class Match
  include Mongoid::Document
  field :start_score, type: Integer
  embeds_many :players
  accepts_nested_attributes_for :players
  
end
