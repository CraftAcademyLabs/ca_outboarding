class Skill < ApplicationRecord
  belongs_to :user

  enum of_type: { tech: 0, soft: 1 }
  enum proficiency: { junior: 0, intermediate: 1, advanced: 2 }

  validates_presence_of :name, :of_type, :proficiency
end
