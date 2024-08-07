# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create 5 restaurants with fake data
require 'faker'

Restaurant.destroy_all

5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )
end

puts '5 restaurants have been created with Faker.'

Restaurant.all.each do |restaurant|
  5.times do
    Review.create!(
      restaurant: restaurant,
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
  end
end

puts '5 reviews have been created with Faker.'
