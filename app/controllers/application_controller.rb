# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

  def authorized_to_access? 
    if current_user 
      current_user.recruiter? ? current_user.subscriber? : true
    end 
  end
end
