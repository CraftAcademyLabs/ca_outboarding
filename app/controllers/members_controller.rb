class MembersController < ApplicationController
  def index
    # if authorized_to_access?
    #   @members = User.member
    # else
    #   redirect_to new_subscription_path, notice: 'You are not authorized to enter, please purchase a subscription'
    # end
    @members = User.member
  end

  def show
    @member = User.find(params[:id])
  end

  def edit
    
  end

  def update
    if current_user.update_attributes(member_params)
      redirect_to member_path(current_user), notice: 'Your account info was updated'
    else
      redirect_back(fallback_location: root_path, notice: "We could not save your updates. #{current_user.errors.full_messages.to_sentence}")
    end
  end

  def crafted
    binding.pry
  end

  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :avatar)
  end
end
