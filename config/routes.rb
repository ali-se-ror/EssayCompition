Rails.application.routes.draw do

  devise_for :users

  root "rewards#index"
  resources :essays do
    collection do
      get :my_rewards
    end

  end
  resources :rewards, only: [:index]

end
