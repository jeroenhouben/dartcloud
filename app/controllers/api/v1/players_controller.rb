class Api::V1::PlayersController < ApplicationController
  respond_to :json
    
  def index
    respond_with Player.all
  end

end
