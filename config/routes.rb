Rails.application.routes.draw do

  devise_for :administrators
  resources :role_collaborators

  resources :role_candidates

  resources :needs_analyses do
    collection do
      post 'edit_candidate' => 'needs_analyses#edit_candidate', as: :edit_candidate
      put 'update_candidate' => 'needs_analyses#update_candidate', as: :update_candidate
      post 'edit_collaborator' => 'needs_analyses#edit_collaborator', as: :edit_collaborator
      put 'update_collaborator' => 'needs_analyses#update_collaborator', as: :update_collaborator
    end
  end

  resources :activities

  devise_for :candidates
  resources :candidates, only: [:index, :show, :destroy]
  resources :collaborations

  get '/candidates/:id(.:format)/collaborator' => 'candidates#collaborator_show', :as => :collaborator_show
  get '/admin' => 'pages#admin'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

end