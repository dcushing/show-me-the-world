Rails.application.routes.draw do
  
  scope "/:locale" do
    resources :static_pages
  end
  
  root 'static_pages#home'  
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/trip'
  
end
