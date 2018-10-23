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

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path
end