Rails.application.routes.draw do
  root to: "pages#home"

  get "a_propos", to: "pages#a_propos"
  get "contact", to: "pages#contact"
  get "formation", to: "pages#formation"
  get "experiences", to: "pages#experiences"

  resources :creations, only: [:index, :show]


end
