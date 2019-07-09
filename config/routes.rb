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

  resources :trips do
    scope module: :trips do
      resources :activities, except: %i[index show]
    end
  end
end
