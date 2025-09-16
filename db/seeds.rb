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
  {
    name: "Buddha Bowl",
    category: "Bowls",
    price: 12,
    description: "Quinoa, pois chiches rôtis, avocat, carottes, chou rouge, houmous et graines de sésame.",
    available: true
  },
  {
    name: "Poke Bowl saumon",
    category: "Bowls",
    price: 14,
    description: "Saumon frais mariné, riz vinaigré, edamame, concombre, mangue et sauce soja-sésame.",
    available: true
  },
  {
    name: "Poke Bowl tofu",
    category: "Bowls",
    price: 12,
    description: "Tofu mariné grillé, riz vinaigré, edamame, avocat, radis et sauce teriyaki.",
    available: true
  },
  {
    name: "Falafels maison",
    category: "Wraps & Sandwiches",
    price: 10,
    description: "Falafels croustillants, houmous, salade verte, tomates fraîches et sauce tahini dans un wrap.",
    available: true
  },
  {
    name: "Poulet tandoori",
    category: "Wraps & Sandwiches",
    price: 11,
    description: "Poulet mariné aux épices tandoori, yaourt grec, concombre, salade et coriandre dans un pain pita.",
    available: true
  },
  {
    name: "Chia pudding",
    category: "Desserts",
    price: 6,
    description: "Graines de chia au lait de coco, purée de mangue, granola croustillant et fruits frais.",
    available: true
  },
  {
    name: "Cake matcha",
    category: "Desserts",
    price: 6,
    description: "Gâteau moelleux au thé matcha, nappé d’un léger glaçage au citron.",
    available: true
  },
  {
    name: "Smoothies frais",
    category: "Boissons",
    price: 5,
    description: "Mélange de fruits frais de saison (banane, fraise, mangue, épinards ou myrtilles).",
    available: true
  },
  {
    name: "Cafés latte art",
    category: "Boissons",
    price: 4,
    description: "Expresso de café arabica bio, lait mousseux et motifs en latte art.",
    available: true
  },
  {
    name: "Kombucha maison",
    category: "Boissons",
    price: 5,
    description: "Boisson pétillante fermentée au thé vert, gingembre et citron.",
    available: true
  }
]


dishes.each do |dish|
  Dish.create!(dish)
end

puts "✅ Seeds loaded : #{User.count} user(s), #{Dish.count} dish(es)"
