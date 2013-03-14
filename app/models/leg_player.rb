class LegPlayer < ActiveRecord::Base

 self.primary_key = "id"
 
 belongs_to :leg
 belongs_to :player

end
