# frozen_string_literal: true

Then(/^he should( not)? see "([^"]*)" in "([^"]*)" section$/) do |negate, expected_content, section|
    assertion_method = negate ? :not_to : :to
    case section.downcase
    when 'members'
      dom_section = '.members'
    when 'profile'
      dom_section = '#profile'
    when 'form'
      dom_section = '#error_messages'
    end
    within(dom_section) do
      expect(page).send(assertion_method, have_content(expected_content)) 
    end
end

Then("I/he should see {string}") do |expected_content|
  expect(page).to have_content expected_content
end

Then("I/he should not see {string}") do |expected_content|
  expect(page).not_to have_content expected_content
end

Then("he should be on his profile page") do
  expect(current_path).to eq member_path(@user)
end

Then("he should be on the profile page of {string}") do |email|
  member = User.find_by_email(email)
  expect(current_path).to eq member_path(member)
end

Then("I/he should be (on the )(redirected to )subscription page") do
  expect(current_path).to eq new_subscription_path
end

Then("he should see {string} image") do |file_name|
  expect(page).to have_selector "img[src*='#{file_name}']"
end

Then("(I/he )should be redirected to index page") do
  expect(current_path).to eq root_path
end

Then("he should be on the admin page") do
  expect(current_path).to eq admin_root_path
end

Then("he should be redirected to craft oauth page") do
  expect(current_path).to eq user_crafted_oauth_omniauth_authorize_path
end

Then("he should see a link {string}") do |element_text|
  expect(page).to have_link element_text
end

Then("he should see a link {string} within resource {string}") do |link, resource_description|
  resource = Resource.find_by(description: resource_description)
  dom_section = "#resource_#{resource.id}"
  within(dom_section) do
    expect(page).to have_content(link)
  end
end

Then("he should be on the {string} page") do |page|
  expect(current_path).to eq page_path(page)
end

Then("he should see the about us information") do
  expect(page).to have_content "Craft Academy is a twelve-week intensive course designed to take you from zero to junior programmer. We're a group of dedicated coaches with decades of coding experience."
end

Then("he should see the employers information") do
  expect(page).to have_content "We strive to train junior developers who will seamlessly fit into a workplace, ready to hit the ground running and dive into real projects. We train not just competent coders, with a wide range of skills, but teammates, problem-solvers and leaders."
end

Then("he should see the curriculum information") do
  expect(page).to have_content "We strive to train junior developers who will seamlessly fit into a workplace, ready to hit the ground running and dive into real projects. We train not just competent coders, with a wide range of skills, but teammates, problem-solvers and leaders."
end

Then("he should see {string} in the {string}") do |name, type|
  of_type = type.split.first.downcase
  skill = Skill.find_by(of_type: of_type, name: name)
  dom_section = "#skill_#{skill.id}"
  within(dom_section) do
    expect(page).to have_content(name)
  end
end

Then("he should see {string} within {string}") do |level, name|
  skill = Skill.find_by(name: name)
  dom_section = "#skill_#{skill.id}"
  within(dom_section) do
    expect(page).to have_content(level)
  end
end
