Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, except: [:show],
      shallow: true

    collection do
      get :my
    end
  end

  root 'posts#index'
end
