Resource.destroy_all
User.destroy_all

require 'faker'

10.times do
    user = User.create!( email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name:Faker::Name.last_name,
        password: "password",
        gender: Faker::Gender.binary_type,
        age: rand(18..99),
        role: :member )
    user.avatar.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy_avatar.png')), filename: "avatar-#{user.email}.png", content_type: 'image/png')

end

Resource.create([
    { description: 'FizzBuzz', of_type: 'repo' , url: 'https://rhongabriel.github.io/address_book//index.html', user: User.first},
    { description: 'BMI calculator', of_type: 'website', url: 'https://rhongabriel.github.io/address_book//index.html', user: User.first},
    { description: 'Slowfood', of_type: 'repo', url: 'https://rhongabriel.github.io/address_book//index.html', user: User.first},
    { description: 'Newsroom', of_type: 'website', url: 'https://rhongabriel.github.io/address_book//index.html', user: User.first},
    { description: 'Address Book', of_type: 'repo', url: 'https://rhongabriel.github.io/address_book//index.html', user: User.first},
    { description: 'Cooper challenge app', of_type: 'website', url: 'https://rhongabriel.github.io/address_book//index.html', user: User.first}
])

Skill.create([
    { name: 'Javascript', of_type: 'tech' , proficiency: 'junior', user: User.first},
    { name: 'Ruby on Rails', of_type: 'tech' , proficiency: 'intermediate', user: User.first},
    { name: 'Team manegment', of_type: 'soft' , proficiency: 'advanced', user: User.first},
    { name: 'Organizing', of_type: 'soft' , proficiency: 'junior', user: User.first},
])