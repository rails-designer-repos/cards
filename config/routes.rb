Rails.application.routes.draw do
  concern :reposition do
    collection do
      patch :reposition, controller: "reposition", action: "update", defaults: { resource_name: "board/#{@scope.frame.dig(:controller)}" }
    end
  end

  resources :columns, only: %w[create update], concerns: :reposition
  resources :cards, only: %w[create update], concerns: :reposition

  root to: "pages#show"
end
