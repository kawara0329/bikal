Rails.application.routes.draw do
  devise_for :users
  get 'bikes/index'
  root to: "bikes#index"
end
