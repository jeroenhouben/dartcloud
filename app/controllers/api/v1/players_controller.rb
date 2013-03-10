module Api
  module V1
    class PlayersController < ApplicationController
  
      SAMPLE_DATA = [
      	{id: "1", name: "Nobby van Es"},
      	{id: "2", name: "Beiñe Fafiño"},
      	{id: "3", name: "Dave Goulash"},
      	{id: "4", name: "Jean Faf"},
      	{id: "5", name: "Perluigi"},
      	{id: "6", name: "Els Fomper"}
      ]
  
      def index
        render json: SAMPLE_DATA
      end
  
    end
  end
end