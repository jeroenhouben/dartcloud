class LegPlayer < ActiveRecord::Base

 self.primary_key = "id"
 
 belongs_to :leg
 belongs_to :player

 has_many :turns, :dependent => :destroy

 attr_accessor :shallow_serialize

 
end
