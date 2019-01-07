# frozen_string_literal: true

module ApplicationHelper
  def authorized_to_access?
    if current_user
      current_user.recruiter? ? current_user.subscriber? : true
    else
      true
    end
  end

  def icon_helper(icon)
    "https://assets.craftacademy.se/images/icons/#{icon}"
  end

  def background_helper(background_image)
    "https://assets.craftacademy.se/images/backgrounds/#{background_image}"
  end
end
