Rails.application.routes.draw do
  root 'home#index'

  resources :students
  resources :courses
  resources :classrooms, only: [:new, :create]
  resources :home, only: :index
end
