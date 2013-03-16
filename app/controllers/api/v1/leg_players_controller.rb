module Api
  module V1
    class LegPlayersController < ApplicationController
      respond_to :json

      # GET /legs/1
      def show
        lp = LegPlayer.find(params[:id])
        render json: lp
      end
      
      # POST
      def create
        lp = LegPlayer.new(permitted_params)

        if lp.save
          render json: lp, status: :created
        else
          render json: lp.errors, status: :unprocessable_entity
        end
      end

      private
        # Only allow a trusted parameter "white list" through.
        def permitted_params
          params.require(:leg_player).permit(:id, :leg_id, :player_id)
        end

    end
  end
end