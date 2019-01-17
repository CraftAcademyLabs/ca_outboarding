require 'yaml'

class CurriculumService
  def list
    YAML.load(File.read("#{::Rails.root}/lib/assets/curriculum_weeks_en.yml"))
  end
end