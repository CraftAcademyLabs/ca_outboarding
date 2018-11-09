# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { 'password' }

    factory :member do
      email { 'student@craft.com' }
      first_name { 'Student' }
      last_name { 'Random' }
      role { :member }
    end

    factory :coach do
      email { 'coach@craft.com' }
      first_name { 'Coach' }
      last_name { 'Random' }
      role { :coach }
    end

    factory :recruiter do  
      email { 'recruiter@random.com' }
      first_name { 'Recruiter' }
      last_name { 'Random' }
      role { :recruiter }
      subscriber { false }
    end
  end
end
