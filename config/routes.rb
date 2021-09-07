Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'api/v1/client#social_network_response'

  namespace :api do
    namespace :v1 do
      resources :client do
        collection do
          get :social_network_response
        end
      end
    end
  end
end
