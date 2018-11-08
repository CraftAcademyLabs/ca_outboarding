# frozen_string_literal: true

Given('(the following users exists)(the following user exists)') do |table|
  table.hashes.each do |member_hash|
    create(:member, member_hash)
  end
end

Given("he has the following projects") do |table|
  table.hashes.each do |project|
    user = User.last
    create(:resource,
           description: project[:description],
           url: project[:url],
           type: project[:type],
           user: user)
  end
end

