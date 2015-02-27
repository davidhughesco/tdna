Rails.application.routes.draw do

  resources :activities

  devise_for :candidates
  resources :candidates, only: [:index, :show, :destroy]
  resources :collaborations

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

end