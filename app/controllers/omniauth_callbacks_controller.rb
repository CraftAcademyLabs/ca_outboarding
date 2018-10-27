# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'LinkedIn') if is_navigational_format?
    else
      session['devise.linkedin_date'] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end

  def crafted_oauth
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'CraftEd') if is_navigational_format?
    else
      session['devise.crafted_date'] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end


  def failure
    redirect_to root_path, notice: 'Could not authenticate you!'
  end
end
