require 'yaml'

class CurriculumService
  def list
    YAML.load(File.read("#{::Rails.root}/lib/assets/curriculum_weeks_en.yml"))
	end
	
	def course_dates
		YAML.load(File.read("#{::Rails.root}/lib/assets/intakes.yml"))
	end
end
