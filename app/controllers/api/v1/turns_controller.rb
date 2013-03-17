module Api
  module V1
    class TurnsController < ApplicationController
      respond_to :json

      # GET /legs/1
      def show
        t = Turn.find(params[:id])
        render json: t
      end
      
      # POST
      def create
        t = Turn.new(permitted_params)

        if t.save
          render json: t, status: :created
        else
          render json: t.errors, status: :unprocessable_entity
        end
      end

      private
        # Only allow a trusted parameter "white list" through.
        def permitted_params
          params.require(:turn).permit(:id, :leg_player_id, :dart1, :dart2, :dart3, :simple_score, :completed)
        end

    end
  end
end