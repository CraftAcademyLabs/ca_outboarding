class MembersController < ApplicationController
  def index
    @members = User.member
  end
end
