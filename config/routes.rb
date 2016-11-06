Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/teachers' => 'users/teachers', :as => 'teachers'
    get 'users/students' => 'users/students', :as => 'students'
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users
end
