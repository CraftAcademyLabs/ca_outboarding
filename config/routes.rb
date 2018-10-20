# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :members, action: :index
end
