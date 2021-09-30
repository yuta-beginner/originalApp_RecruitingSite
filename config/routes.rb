Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resource :users, only: [:get, :edit, :update] do
    member do
      get "mypage", :to => "mypage#mypage"
      get "mypage/edit", :to => "mypage#edit"
      put "mypage", :to => "mypage#update"
    end
  end
end
