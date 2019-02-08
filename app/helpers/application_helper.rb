6# frozen_string_literal: true

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

  def list_curriculum
    CurriculumService.new().list
  end

	def course_dates
		CurriculumService.new().course_dates
	end

	def future_courses
		course_dates = CurriculumService.new().course_dates
		course_dates.select {|c| Date.parse(c["start_date"]) >= Date.today  }
	end
end
