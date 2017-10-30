Rails.application.routes.draw do
  
  
  scope "/:locale" do
    resources :static_pages, only: [:show]
  end
  
  root 'places#show'  
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'info' => 'places#info'
  
  resources :places, only: [:index, :show, :info]
  
end
