# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index; end

  def new; end

  def create
    user = User.create(user_params.merge(password: Devise.friendly_token[0, 20]))
    @message = if user.persisted?
                 'A new user has been created'
               else
                 'This did not work'
               end
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
