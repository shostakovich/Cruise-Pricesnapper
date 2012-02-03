Pricetag::Application.routes.draw do
  resources :prices

  resources :cruises

  root :to => 'cruises#index'
end
