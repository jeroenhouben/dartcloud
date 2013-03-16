module Api
  module V1
    class PlayersController < ApplicationController
      respond_to :json
  
      def index
        render json: Player.all
      end

      def update
        player = Player.find(params[:id])
        render json: player#, status: :updated
        # if p.update(permitted_params)
        # else
        #   render json: p.errors, status: :unprocessable_entity
        # end
      end

      private
        # Only allow a trusted parameter "white list" through.
        def permitted_params
          params.require(:player).permit(:id, :name)
        end
  
    end
  end
end