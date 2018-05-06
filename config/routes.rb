Rails.application.routes.draw do

  root 'welcome#index'
  get '/resume', to: 'welcome#resume'
  match 'sms_verify', to: 'sms_verify#verify', via: :post

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
