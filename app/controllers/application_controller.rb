# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :get_slider_entries

  private

  def get_slider_entries
    @entries = [
      { marketing_slug: 'Just some text',
        image_url: 'https://assets.craftacademy.se/images/backgrounds/ca_background_git.png' },
      { marketing_slug: 'Just some text',
        image_url: 'https://assets.craftacademy.se/images/backgrounds/ca_background_group_coding.png' }
    ]
  end
end

