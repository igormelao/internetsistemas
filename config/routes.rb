Rails.application.routes.draw do
  resources :students, except: :show
  resources :courses, except: :show
  resources :classrooms, only: [:new, :create, :edit, :update]
end
