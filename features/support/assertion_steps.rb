# frozen_string_literal: true

Then(/^he should( not)? see "([^"]*)" in "([^"]*)" section$/) do |negate, expected_content, section|
    assertion_method = negate ? :not_to : :to
    case section.downcase
    when 'members'
      dom_section = '.members'
    when 'profile'
      dom_section = '#profile'
    end
    within(dom_section) do
      expect(page).send(assertion_method, have_content(expected_content)) 
    end
end

Then("he should see {string}") do |expected_content|
  expect(page).to have_content expected_content
end

Then("he should be on his profile page") do
  expect(current_path).to eq member_path(@user)
end

Then("he should be on the subscription page") do
  expect(current_path).to eq new_subscription_path
end

Then("he should see {string} image") do |file_name|
  expect(page).to have_selector "img[src*='#{file_name}']"
end

Then("(I/he )should be redirected to index page") do
  expect(current_path).to eq root_path
end
