Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get "/home/about" => "homes#about"

  resources :books, only: [:create, :index, :edit, :show, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  end


