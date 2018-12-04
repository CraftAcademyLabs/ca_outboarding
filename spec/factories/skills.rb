FactoryBot.define do
  factory :skill do

    factory :soft do
      user { create(:member) }
      name { "MyString" }
      of_type { "soft" }
      proficiency { "junior" }
    end

    factory :tech do
      user { create(:member) }
      name { "MyString" }
      of_type { "tech" }
      proficiency { "advanced" }
    end
  end
end
