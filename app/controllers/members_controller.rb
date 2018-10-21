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
    binding.pry

  end
end
