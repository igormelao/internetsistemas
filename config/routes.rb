Rails.application.routes.draw do
  resources :students
  resources :courses
  resources :classrooms, only: [:new, :create, :edit, :update]
end
