# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# --- Création du compte admin ---
User.find_or_create_by!(email: "admin@nomade.fr") do |user|
  user.password = "supermotdepasse"
  user.password_confirmation = "supermotdepasse"
end

# --- Création des plats ---
dishes = [
  { name: "Buddha Bowl", category: "Bowls", price: 12 },
  { name: "Poke Bowl saumon", category: "Bowls", price: 14 },
  { name: "Poke Bowl tofu", category: "Bowls", price: 12 },
  { name: "Falafel maison", category: "Wraps & Sandwiches", price: 10 },
  { name: "Poulet tandoori", category: "Wraps & Sandwiches", price: 11 },
  { name: "Chia pudding", category: "Desserts", price: 6 },
  { name: "Cake matcha", category: "Desserts", price: 6 },
  { name: "Smoothies frais", category: "Boissons", price: 5 },
  { name: "Cafés latte art", category: "Boissons", price: 4 },
  { name: "Kombucha maison", category: "Boissons", price: 5 }
]

dishes.each do |dish|
  Dish.create!(dish)
end

puts "✅ Seeds loaded : #{User.count} user(s), #{Dish.count} dish(es)"
