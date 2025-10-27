Rails.application.routes.draw do
  resources :columns, only: %w[update]
  resources :cards, only: %w[create update]

  root to: "pages#show"
end
