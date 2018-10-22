class MembersController < ApplicationController
  def index
    @members = User.member
  end

  def show
    @member = User.find(params[:id])
  end

  def edit
    
  end

  def update
    if current_user.update_attributes(member_params)
      redirect_to root_path, notice: 'Your account info was updated'
    else
      redirect_back(fallback_location: root_path, notice: 'We could not save your updates, please try again...')
    end
  end

  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name)
  end
end
