class LegPlayer < ActiveRecord::Base

 self.primary_key = "id"
 
 belongs_to :leg
 belongs_to :player

 before_create { |record| record.id = SecureRandom.uuid  }

end
