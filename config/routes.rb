# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root controller: :members, action: :index
  resources :members, only: [:show, :edit, :update]
end
