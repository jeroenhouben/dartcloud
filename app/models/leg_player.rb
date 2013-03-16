class LegPlayer < ActiveRecord::Base

 self.primary_key = "id"
 
 belongs_to :leg
 belongs_to :player

 has_many :turns, :dependent => :destroy

 before_create { |record| record.id = SecureRandom.uuid  }

 attr_accessor :shallow_serialize

 
end
