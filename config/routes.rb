Dartcloud::Application.routes.draw do
  # You can have the root of your site routed with "root"
  root to: 'ember#start'

  namespace :api do
    namespace :v1 do
      resources :players
      resources :matches
    end
  end

end
