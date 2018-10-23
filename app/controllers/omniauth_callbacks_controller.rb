class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted? 
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'LinkedIn') if is_navigational_format?
    else
        session['devise.linkedin_date'] = request.env['omniauth.auth']
        redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path, notice: 'Could not authenticate you!'
  end

  def cognitive_class
    callback_from :cognitive_class
  end
  
  private

  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:success] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      if provider == 'twitter'
        session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
      else
        session["devise.#{provider}_data"] = request.env['omniauth.auth']
      end
      redirect_to new_user_registration_url
    end
  end
end
