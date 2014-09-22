Rails.application.routes.draw do
  resources :users
  post 'users/sort' => 'users#sort' , as: :sort_users
end
