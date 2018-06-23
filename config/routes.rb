Rails.application.routes.draw do
  get 'images/index'
  get 'preview_image' => 'images#preview'
  get 'validate_balance' => 'wallet_transactions#validate_balance'
  resources :wallet_transactions
  resources :images
  resources :friends do
    member do
      get 'send_request'
      get 'cancel_request'
      get 'confirm_request'
      get 'reject_request'
      get 'friend_list'
    end
  end
  resources :profile do 
    collection do 
      get 'payment'
    end
  end

  resources :payements

  post '/payu_callback'=>'payements#payu_return'

  get '/downvote' => 'likes#downvote'
  root 'home#index'
  get '/referralcode/:code' => 'home#index' ,as: '/referralcode'
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
  devise_for :users, :controllers => {:passwords => "users/passwords",:registrations => "users/registrations",sessions: 'users/sessions'}
  # devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
