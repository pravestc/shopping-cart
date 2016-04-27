# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Item.exists?(name: "Ring of Basilius")
  Item.create!(name: 'Ring of Basilius', legend: "Ring given as a reward to the greatest mages.", effect: "Passive: Basilius Aura - Grants mana regeneration and armor in a 900 area of effect.
            Active: Toggle whether the aura affects other non-hero units.

            Multiple instances of Basilius Aura do not stack.", stats: "+ 6 Damage
+ 1 Armor
AURA MANA REGEN: 0.65
AURA BONUS ARMOR: 2 ", price: 50000)
end

unless Item.exists?(name: "Flying Courier")
  Item.create!(name: "Flying Courier", legend: "", effect: "Upgrades your team's Animal Courier to a Flying Courier, granting it swift, unobstructed movement to carry items to and from your team's base.

            Requires a deployed Animal Courier. ", stats: "", price: 15000)
end

unless User.exists?(email: "shopkeeper@shopping-cart.com")
  User.create!(email: "shopkeeper@shopping-cart.com", password: "password", shopkeeper: true)
end

unless User.exists?(email: "user@shopping-cart.com")
  User.create!(email: "user@shopping-cart.com", password: "password")
end
