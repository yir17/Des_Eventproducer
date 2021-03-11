Rails.application.routes.draw do
  resources :bands do
    resources :concerts
  end 
end