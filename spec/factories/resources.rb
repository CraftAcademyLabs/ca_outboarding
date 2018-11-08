FactoryBot.define do
  factory :resource do
    user
    description { 'My project' }
    url { 'www.google.com' }
    type { 1 }
  end
end
