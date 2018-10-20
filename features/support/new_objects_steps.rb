# frozen_string_literal: true

Given('the following users exists') do |table|
  table.hashes.each do |member_hash|
    create(:member, member_hash)
  end
end
