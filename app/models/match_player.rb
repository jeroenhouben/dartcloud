class MatchPlayer < ActiveRecord::Base

  self.primary_key = "id"

  belongs_to :match
  belongs_to :player
  
  before_create { |record| record.id = SecureRandom.uuid  }

end
