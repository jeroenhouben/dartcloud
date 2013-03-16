module Api
  module V1
    class LegsController < ApplicationController
      respond_to :json

      # GET /legs/1
      def show
        leg = Leg.find(params[:id])
        render json: leg
      end
    end
  end
end