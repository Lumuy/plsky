Rails.application.routes.draw do

  root 'home#index'
  get '/resume', to: 'home#resume'
  get 'settings', to: 'settings#show'
  match 'sms_verify', to: 'sms_verify#verify', via: :post

  resource :setting, only: [:update]
  resources :posts, only: [:new, :create, :edit, :update, :destroy, :show] do
    resources :comments, only: [:create, :update, :destroy, :edit]
  end

  scope :registration do
    get 'log_out', to: 'registration/sessions#destroy', as: 'log_out'
    get 'log_in', to: 'registration/sessions#new', as: 'log_in'
    get 'sign_up', to: 'registration/users#new', as: 'sign_up'
    match 'img_verify', to: 'registration/users#imgverify', via: :post
    match 'users', to: 'registration/users#create', via: :post
    match 'sessions', to: 'registration/sessions#create', via: :post
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
