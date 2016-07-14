Rails.application.routes.draw do
  resources :students, except: :show
  resources :courses, except: :show
end
