# frozen_string_literal: true

module ApplicationHelper
  def authorized_to_access?
    if current_user
      current_user.recruiter? ? current_user.subscriber? : true
    else
      true
    end
  end
end
