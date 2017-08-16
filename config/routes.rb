Rails.application.routes.draw do
  
  resources :places, only: [:index, :show]
  
  
  scope "/:locale" do
    resources :static_pages, only: [:show]
  end
  
  root 'places#show'  
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'new_place' => 'places#show'
  
end
