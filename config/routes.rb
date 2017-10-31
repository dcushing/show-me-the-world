Rails.application.routes.draw do

  scope "/:locale" do
    resources :static_pages, only: [:show]
  end
  
  root 'places#index'  
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'info' => 'places#info'
  get 'show' => 'places#show'
  
  resources :places, only: [:index, :show, :info]
  
end
