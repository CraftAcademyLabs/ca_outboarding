# frozen_string_literal: true

class User < ApplicationRecord
  validates_length_of :first_name, minimum: 3, maximum: 50, allow_blank: true
  validates_length_of :last_name, minimum: 3, maximum: 50, allow_blank: true

  def full_name
    [first_name, last_name].join(' ') if first_name && last_name
    end

  def display_name
    full_name.squish.empty? ? email : full_name
  end
end
