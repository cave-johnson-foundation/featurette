CaveJohnsonFoundation::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match "/auth/:provider/callback" => "sessions#create", :as => :auth_callback
  match "/auth/failure" => "sessions#failure", :as => :auth_failure
  match "/logout" => "sessions#destroy", :as => :logout

  resources :apps do
    resources :features do
      resources :donations
    end
  end


  root to: 'apps#index'
end
