# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: :omniauth_callbacks,
    registrations: :registrations,
    sessions: :sessions
  }
  root controller: :members, action: :index
  resources :members, only: [:show, :edit, :update]
  get '/oauth2/callback', controller: :members, action: :crafted
  
end
