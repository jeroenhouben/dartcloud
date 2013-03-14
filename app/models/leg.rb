class Leg < ActiveRecord::Base

  belongs_to :match
  belongs_to :winner
  has_many :leg_players, :dependent => :destroy

  accepts_nested_attributes_for :leg_players

end
