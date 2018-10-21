# frozen_string_literal: true

When('a visitor/member visits the site') do
  visit root_path
end

Then('stop') do 
  binding.pry
end

Given("member {string} is logged in") do |email|
  user = User.find_by_email(email)
  sign_in(user)
end
