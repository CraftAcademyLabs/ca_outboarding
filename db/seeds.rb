require 'faker'

10.times do
    User.create!( email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name:Faker::Name.last_name,
        encrypted_password: "password",
        role: 1,
        gender: Faker::Gender.binary_type,
        age: rand(18..99))
end