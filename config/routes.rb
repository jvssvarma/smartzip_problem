Rails.application.routes.draw do
  resources :respondents
  resources :campaigns
  resources :user_profiles
  devise_for :users, controllers: { registrations: "registrations" }
  root "campaigns#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
