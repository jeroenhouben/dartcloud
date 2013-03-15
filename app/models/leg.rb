class Leg < ActiveRecord::Base

  self.primary_key = "id"

  belongs_to :match
  belongs_to :winner
  has_many :leg_players, :dependent => :destroy

end
