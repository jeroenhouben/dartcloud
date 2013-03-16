class Turn < ActiveRecord::Base

 self.primary_key = "id"

 belongs_to :leg_player

end
