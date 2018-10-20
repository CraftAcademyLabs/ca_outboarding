# frozen_string_literal: true

Then('he should see {string} in {string} section') do |expected_content, section|
  case section.downcase
  when 'members'
    dom_section = '.members'
  end
  within(dom_section) do
    expect(page).to have_content expected_content
  end
end
