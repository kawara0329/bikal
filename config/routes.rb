Rails.application.routes.draw do
  get 'bikes/index'
  root to: "bikes#index"
end
