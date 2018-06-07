Rails.application.routes.draw do
  resources :friends do
    member do
      get 'send_request'
    end
  end
  resources :profile

  get '/downvote' => 'likes#downvote'
  root 'home#index'
  resources :post do 
  	collection do
  		get 'create_comment'
  	end
    member do
      delete 'delete_comment'
    end
  end
  resources :likes ,only: [:index]

  
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations",sessions: 'users/sessions'}
  # devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
