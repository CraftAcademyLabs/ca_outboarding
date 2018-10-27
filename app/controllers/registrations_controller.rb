# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :js

  def new
    if params[:id]
      @form = 'ca_cred'
    else
      @form = 'form'
    end
    super
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      flash[:notice] = 'Welcome! You have signed up successfully.'
      sign_up(resource_name, resource)
      redirect_to after_sign_in_path_for(resource)
    else
      errors = resource.errors.full_messages
      render json: { message: errors }, status: 422
    end
  end

  def crafted
    client = OAuth2::Client.new('fc423812c608c1dee580',
                                'da05530d5474b9df66d53174bebeea24b1a2dda7',
                                site: 'https://class.craftacademy.co',
                                authorize_url: "/oauth2/authorize",
                                token_url: "/oauth2/access_token")
    token = client.password.get_token(params[:user][:email], params[:user][:password])
    response = JSON.parse(token.get('/api/user/v1/accounts').body)[0]
    build_resource(email: response["email"], password: params[:user][:password])
    arr_name = response["name"].split(' ')
    resource.last_name = arr_name.pop unless arr_name.length >= 1
    resource.first_name = arr_name.join(' ')
    resource.role = 0
    binding.pry
    if resource.save
      flash[:notice] = 'Welcome! You have signed up successfully.'
      sign_up(resource_name, resource)
      binding.pry
      redirect_to after_sign_in_path_for(resource)
    else
      errors = resource.errors.full_messages
      render json: { message: errors }, status: 422
    end
  end
end
