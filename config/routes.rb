Rails.application.routes.draw do
  resources :pill_list_joins
  resources :pill_lists
  resources :users
  resources :pills
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
