# frozen_string_literal: true

When('(a visitor/member visits the site)(when he returns to the index page)(I visit the site)(he visits the site)') do
  visit root_path
end

Then('stop') do 
  binding.pry
end

Given("member/recruiter {string} is logged in") do |email|
  @user = User.find_by_email(email)
  login_as(@user)
end


Given("(he )clicks {string} on his listing") do |element|
  within "#user_#{@user.id}" do 
    click_on element
  end
end

Given("(he )clicks {string} on {string}") do |element, email|
  user = User.find_by_email(email)
  within "#user_#{user.id}" do 
    click_on element
  end
end

Given("(he/I )click(s) (on ){string}") do |element|
  click_on element
end

Given('(he )fills in {string} with {string}') do |input_field, content|
  fill_in input_field, with: content
end

Given("(he/she )attaches {string}") do |file_name|
  attach_file('member_avatar', "#{::Rails.root}/spec/fixtures/#{file_name}")
end

Given("the LinkedIn authentication is not granted") do
  OmniAuth.config.mock_auth[:linkedin] = :invalid_credentials
end

Then("wait {int} second(s)") do |time|
  sleep time
end
