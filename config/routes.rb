Pricetag::Application.routes.draw do
  resources :cruises
  
  root :to => 'cruises#index'
end
