Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'welcome#index'

  get '/resume', to: 'welcome#resume'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
