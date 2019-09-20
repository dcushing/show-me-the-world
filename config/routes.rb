Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
  get '/about', to: 'static_pages#about'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_status_error'
  resources :places, only: [:index, :show]

end
