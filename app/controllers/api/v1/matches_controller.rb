module Api
  module V1
    class MatchesController < ApplicationController
      respond_to :json

      # GET /mes
      def index
        render json: Match.all
      end

      # GET /mes/1
      def show
        m = Match.find(params[:id])
        render json: m
      end

      # POST /mes
      def create
        m = Match.new(match_params) {|m| m.id = match_params[:id]} # use the primary key sent by the client
        if m.save
          render json: m, status: :created
        else
          render json: m.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /mes/1
      def update
        m = Match.find(params[:id])
        if m.update(match_params)
          render json: m, status: :updated
        else
          render json: m.errors, status: :unprocessable_entity
        end
      end

      # DELETE /mes/1
      def destroy
        m = Match.find(params[:id]).destroy
        render json: m
      end

      private
        # Only allow a trusted parameter "white list" through.
        def match_params
          params.require(:match).permit(:id, :start_score, legs: [:id, :match_id, :winner_id])
        end
    end
  end
end