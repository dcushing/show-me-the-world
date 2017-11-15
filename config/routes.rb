Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'

  scope "/:locale" do
    resources :static_pages, only: [:show]
  end
  
  root 'places#index'  
  get 'about' => 'static_pages#about'
  get 'show' => 'places#show'
  
  # for the pretty error pages
  match "/404", :to => 'errors#not_found', :via => :all
  match "/500", :to => 'errors#internal_server_error', :via => :all
  
  resources :places, only: [:index, :show]
  
end
