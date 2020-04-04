# frozen_string_literal: true

Rails.application.routes.draw do
  resources :age_categories, only: %i[index]
  resources :news_categories, only: %i[index]
  resources :users, only: %i[create]
  get :current_user, to: 'users#get_current_user'
  post :authenticate, to: 'authentication#authenticate'
end
