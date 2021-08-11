Rails.application.routes.draw do
  devise_for :users
  root to: "bikes#index"
  resources :bikes, only: [:index, :new, :create]
end
