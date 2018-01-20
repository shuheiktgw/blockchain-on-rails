Rails.application.routes.draw do

  resource :blockchain, only: [:show] do
    resources :transactions, only: [:create]
  end
end
