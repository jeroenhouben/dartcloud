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
        m = Match.find(params[:id])
        render json: m
      end

      # POST /matches
      def create
        match_params = permitted_params

        legs = match_params.extract!(:legs).fetch(:legs, [])
        players = match_params.extract!(:players).fetch(:players, [])
        
        m = Match.new(match_params) {|m| m.id = match_params[:id]} # use the primary key sent by the client
        
        Match.transaction do
          m.save!
          legs.each {|leg_params| Leg.new(leg_params) {|l| l.id = leg_params[:id]}.save! }
          players.each do |player_params| 
            p = Player.find_or_create_by! id: player_params[:id], name: player_params[:name]
            MatchPlayer.create!(player_id: p.id, match_id: m.id)
          end
        end
                
        if 
          render json: m, status: :created
        else
          render json: m.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /matches/1
      def update
        m = Match.find(params[:id])
        if m.update(match_params)
          render json: m, status: :updated
        else
          render json: m.errors, status: :unprocessable_entity
        end
      end

      # DELETE /matches/1
      def destroy
        m = Match.find(params[:id]).destroy
        render json: m
      end

      private
        # Only allow a trusted parameter "white list" through.
        def permitted_params
          params.require(:match).permit(
            :id, :start_score, 
            legs: [:id, :match_id, :winner_id],
            players: [:id, :name]
          )
        end
    end
  end
end