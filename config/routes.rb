Rails.application.routes.draw do
  
  resources :places, only: [:index, :show, :info]
  
  
  scope "/:locale" do
    resources :static_pages, only: [:show]
  end
  
  root 'places#index'  
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  #get 'new_place' => 'places#show'
  #get '/more_info' => 'places#info', as: "more_info"
  get 'info' => 'places#info'
  
end
