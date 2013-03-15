class Player < ActiveRecord::Base

  self.primary_key = "id"
  
  has_many :match_players, :dependent => :destroy
  has_many :matches, :through => :match_players

end
