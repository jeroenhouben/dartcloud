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

        legs    = match_params.extract!(:legs).fetch(:legs, [])
        players = match_params.extract!(:players).fetch(:players, [])
        
        m = Match.new(match_params) {|m| m.id = match_params[:id]} # use the primary key sent by the client
        
        Match.transaction do
          m.save!
          players.each do |player_params|
            p = Player.find_or_create_by! id: player_params[:id], name: player_params[:name]
            MatchPlayer.create!(player_id: p.id, match_id: m.id)
          end
          legs.each do |leg_params| 
            leg_players = leg_params.extract!(:leg_players).fetch(:leg_players, [])
            Leg.new(leg_params) do |leg| 
              leg.id = leg_params[:id]
              leg.save!
              leg_players.each do |lp_params|
                LegPlayer.create!(leg_id: leg.id, player_id: lp_params[:player_id])
              end
            end
          end
        end
        
        if m.persisted?
          m.shallow_serialize = true
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
            legs: [:id, :match_id, :winner_id, leg_players: [:leg_id, :player_id, :id]],
            players: [:id, :name]
          )
        end
    end
  end
end