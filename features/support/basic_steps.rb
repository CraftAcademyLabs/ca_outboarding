# frozen_string_literal: true

When('a visitor visits the site') do
  visit root_path
end

Then('stop') do 
  binding.pry
end
