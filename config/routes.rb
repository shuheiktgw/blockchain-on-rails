Rails.application.routes.draw do

  resource :blockchain, only: [:show]
end
