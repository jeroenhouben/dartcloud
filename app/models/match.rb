class Match < ActiveRecord::Base

 self.primary_key = "id"

 has_many :legs, :dependent => :destroy
 has_many :match_players, :dependent => :destroy
 has_many :players, :through => :match_players

 attr_accessor :shallow_serialize

end
