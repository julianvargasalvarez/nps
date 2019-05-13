Rails.application.routes.draw do
  resources :scores, only: :create
  resources :scores_report, only: :index
end
