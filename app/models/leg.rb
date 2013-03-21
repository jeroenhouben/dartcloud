class Leg
  include Mongoid::Document

  belongs_to :match
  has_many :turns

  # accepts_nested_attributes_for :match
  # accepts_nested_attributes_for :turns


end
