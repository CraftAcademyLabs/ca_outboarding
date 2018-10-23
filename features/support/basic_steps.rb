# frozen_string_literal: true

When('(a visitor/member visits the site)(when he returns to the index page)(I visit the site)') do
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

Given("(he )clickI visit the sites (on ){string}") do |element|
  click_on element
end

Given("(he )fills in {string} with {string}") do |input_field, content|
  fill_in input_field, with: content
end

When("I click {string}") do |element|
  click_on element
end

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path
end