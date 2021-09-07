module Api
  module V1
    class ClientController < ApplicationController
      before_action :initialize_api_service

      def social_network_response
        response = @api.get_social_network_response
        render json: response
      end

      private

      def initialize_api_service
        @api = SocialNetwork::ApiService.new
      end
    end
  end
end