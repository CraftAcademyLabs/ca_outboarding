# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: :omniauth_callbacks,
    registrations: :registrations,
    sessions: :sessions
  }
  root controller: :members, action: :index
  resources :members, only: [:show, :edit, :update]
  devise_scope :user do
    post :crafted, controller: :registrations
  end
end
