class Match < ActiveRecord::Base

 self.primary_key = "id"

 has_many :legs, :dependent => :destroy

 accepts_nested_attributes_for :legs
 
end
