Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :emotions, only: [:index, :show, :create, :update]
  end
end
