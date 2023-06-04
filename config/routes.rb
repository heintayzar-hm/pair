Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  devise_scope :user do
    get 'user_selections/experience', to: 'user_selections#experience', as: 'user_experience'
    post 'user_selections/experience', to: 'user_selections#create_experience'
    get 'user_selections/programming_languages', to: 'user_selections#programming_languages', as: 'user_programming_languages'
    post 'user_selections/programming_languages', to: 'user_selections#create_programming_languages'
  end

  get 'home/index' , to: 'home#index', as: 'home_index'
end
