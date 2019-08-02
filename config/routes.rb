Rails.application.routes.draw do
  root to: "tops#index"
  resources :housings
end
