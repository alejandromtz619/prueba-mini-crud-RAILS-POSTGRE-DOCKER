Rails.application.routes.draw do
  resources :empleados
  resources :paises
  resources :ciudades
  resources :ubicaciones
  resources :cargos
  # Defines the root path route ("/")
  root "personas#index"
  resources :personas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
