# frozen_string_literal: true

class MembersController < ApplicationController

  def index
    @members = User.member
  end

  def show
    @member = User.find(params[:id])
  end

  def edit; end

  def update
    if current_user.update_attributes(member_params)
      redirect_to member_path(current_user), notice: 'Your account info was updated'
    else
      render json: {message: "We could not save your updates. #{current_user.errors.full_messages.to_sentence}" }, status: 422
    end
  end

  def search
    UsersIndex.import
    query = UsersIndex.query(fuzzy: {title: params[:search]})
    @hits = query.hits.count
    @members = query.objects
    render :search
  end

  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :avatar)
  end
end
