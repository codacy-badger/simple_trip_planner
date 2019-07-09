Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root 'trips#index'
    end

    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  devise_for :users

  resources :trips
end
