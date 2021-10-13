Rails.application.routes.draw do
  resources :articles
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  get "mypage", :to => "mypage#mypage"
  delete "mypage", :to => "mypage#destroy"
end
