# frozen_string_literal: true

Given('he fill in and submit the stripe form with {string} credentials') do |card_status|
  case card_status
  when 'valid'
    card_no = '4242424242424242'
  when 'invalid'
    card_no = '4000000000000002'
  end
  stripe_iframe = find("iframe[name='__privateStripeFrame3']")
  within_frame stripe_iframe do
    find_field('cardnumber').send_keys(card_no)
    find_field('exp-date').send_keys('1221')
    find_field('cvc').send_keys('123')
    find_field('postal').send_keys('11310')
  end
  click_on 'Submit Payment'
end
