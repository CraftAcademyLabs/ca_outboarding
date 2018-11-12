FactoryBot.define do
  factory :resource do

    factory :repo do
      user { create(:member) }
      url { 'https://github.com/Prozak8/Fizz_Buzz' }
      description { 'My Fizz Buzz solution' }
      of_type { :repo }
    end

    factory :website do
      user { create(:member) }
      url { 'https://rhongabriel.github.io/address_book//index.html' }
      description { 'My address book website' }
      of_type { :website }
    end
  end
end
