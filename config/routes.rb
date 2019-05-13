Rails.application.routes.draw do
  resources :scores, only: :create
end
