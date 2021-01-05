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
    resources :themes, only:[:index, :show, :destroy]
    resources :answers, only:[:index, :show, :destroy] do
      resources :comments, only:[:destroy]
    end
  end

  scope module: :public do
    resources :users, only:[:edit, :update, :show, :index]
    get 'themes/rankindex' => 'themes#rankindex'
    resources :themes, only:[:index, :create, :new, :show]
    get 'answers/rankindex' => 'answers#rankindex'
    resources :answers, only:[:index, :create, :new, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end
