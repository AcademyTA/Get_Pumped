require 'faker'

## Create Admin Users
User.create(
  email: 'jason@example.com',
  first_name: 'Jason',
  last_name: 'Tam',
  password: 12345678
)

User.create(
  email: 'admin@example.com',
  first_name: 'Admin',
  last_name: 'Istrator',
  password: 12345678
)

## Create test Users
30.times do
  user  = Faker::StarWars.character
  email = user.delete(' ').downcase
  names = user.split(' ')

  User.create(
    email: "#{email}@example.com",
    first_name: names.first,
    last_name: names.last,
    password: 12345678
  )
end

30.times do
  user  = Faker::GameOfThrones.character
  email = user.delete(' ').downcase
  names = user.split(' ')

  User.create(
    email: "#{email}@example.com",
    first_name: names.first,
    last_name: names.last,
    password: 12345678
  )
end
