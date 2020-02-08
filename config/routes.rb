Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'destroy', to: 'devise/sessions#destroy',as: :current_user_destroy
  end

  resources :users
  
  root 'posts#index'
  
  resources :signup ,only: [:index] do
    collection do
      get 'registration'
      post 'registration', to: 'signup#first_validation'
      get 'sms_authentication'
      post 'sms_authentication', to: 'signup#sms_check'
      get 'address'
      post 'address', to: 'signup#second_validation'
      get 'done'
    end
  end

  resources :posts do
    resources :messages
  end

end
