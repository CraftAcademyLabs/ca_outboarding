# frozen_string_literal: true

When('(a visitor/member visits the site)(when he returns to the index page)') do
  visit root_path
end

Then('stop') do 
  binding.pry
end

Given("member {string} is logged in") do |email|
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