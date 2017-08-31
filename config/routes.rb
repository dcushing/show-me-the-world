Rails.application.routes.draw do
  
  resources :places, only: [:index, :show, :info]
  
  
  scope "/:locale" do
    resources :static_pages, only: [:show]
  end
  
  root 'places#index'  
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'info' => 'places#info'
  
end
