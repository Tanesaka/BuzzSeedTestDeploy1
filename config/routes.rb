Rails.application.routes.draw do

  namespace :public do
    get 'users/edit'
    get 'users/update'
    get 'users/show'
    get 'users/index'
  end
  root to: 'homes#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }


  scope module: :public do
    resources :themes, only:[:index, :create, :new, :show, :destroy]
  end
end
