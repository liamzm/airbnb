# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Property.create!(address: '123 Main Street', city: 'Kuala Lumpur', price_per_night: '100', user_id: 1)

# Seed Users
# user = {}
# user['password'] = 'asdf'

# ActiveRecord::Base.transaction do
#   20.times do 
#     user['first_name'] = Faker::Name.first_name 
#     user['last_name'] = Faker::Name.last_name
#     user['email'] = Faker::Internet.email
#     user['phone'] = Faker::PhoneNumber.phone_number
#     user['date_of_birth'] = Faker::Date.between(50.years.ago, Date.today)

#     User.create(user)
#   end
# end 

property = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    property['city'] = Faker::Address.city

    property['address'] = Faker::Address.street_address

    property['price_per_night'] = rand(80..500)

    property['user_id'] = uids.sample

    property['bedrooms'] = rand(1..5)

    Property.create(property)
  end
end