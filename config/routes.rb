Dartcloud::Application.routes.draw do
  root to: 'ember#start'

  namespace :api do
    namespace :v1 do
      resources :players
      resources :matches
    end
  end

end
