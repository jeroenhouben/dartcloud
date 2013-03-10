module Api
  module V1
    class MatchesController < ApplicationController
      respond_to :json

      # GET /matches
      def index
        render json: Match.all
      end

      # GET /matches/1
      def show
        match = Match.find(params[:id])
        render json: match
      end

      # POST /matches
      def create
        match = Match.new(match_params) {|m| m.id = params[:match][:id]}
        if match.save
          render json: match, status: :created
        else
          render json: match.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /matches/1
      def update
        match = Match.find(params[:id])
        if match.update(match_params)
          render json: match, status: :updated
        else
          render json: match.errors, status: :unprocessable_entity
        end
      end

      # DELETE /matches/1
      def destroy
        m = Match.find(params[:id]).destroy
        render json: m
      end

      private
        # Only allow a trusted parameter "white list" through.
        def match_params
          params.require(:match).permit(:id, :start_score)
        end
    end
  end
end