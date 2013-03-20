class Api::V1::MatchesController < ApplicationController
  respond_to :json

  def show
    respond_with Match.find params[:id]
  end
  
  def create
    m = Match.create(params.require(:match).permit!)
    respond_with m, :location => [:api, :v1, m]
  end
  
  def update
    
  end

end
