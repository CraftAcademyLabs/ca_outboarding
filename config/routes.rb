# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index new create]
    root controller: :users, action: :index
  end
  devise_for :users, controllers: {
    omniauth_callbacks: :omniauth_callbacks,
    registrations: :registrations,
    sessions: :sessions
  }
  root controller: :members, action: :index
  resources :members, only: %i[show edit update]
  resources :subscriptions, only: %i[new create]
end
