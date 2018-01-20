Rails.application.routes.draw do

  resource :blockchain, only: [:show] do
    resources :transactions, only: [:create]
    resources :blocks, only: [:create]
  end
end
