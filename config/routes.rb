Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  get 'videos/show'
  root to: "pages#home"

  get "a_propos", to: "pages#a_propos"
  get "contact", to: "pages#contact"
  get "formation", to: "pages#formation"
  get "experiences", to: "pages#experiences"
  get "video", to: "pages#video"

  resources :creations, only: [:index, :show]

  post '/envoyer-message', to: 'messages#create', as: 'envoyer_message'
  resources :messages, only: [:new, :create]

  resources :videos, only: [:show]

  resources :contacts, only: [:new, :create]



end
