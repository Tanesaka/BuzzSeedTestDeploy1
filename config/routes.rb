Rails.application.routes.draw do


  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :themes, only:[:index, :destroy]
  end

  scope module: :public do
    resources :users, only:[:edit, :update, :show, :index]
    get 'themes/rankindex' => 'themes#rankindex'
    resources :themes, only:[:index, :create, :new, :show, :destroy]
    get 'answers/rankindex' => 'answers#rankindex'
    resources :answers, only:[:index, :create, :new, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end
