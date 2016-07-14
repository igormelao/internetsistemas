Rails.application.routes.draw do
  resources :students, except: :show
end
