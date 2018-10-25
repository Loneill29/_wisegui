Rails.application.routes.draw do
  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end 

  devise_for :users

  resources :charges

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
