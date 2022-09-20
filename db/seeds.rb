# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef1 = Chef.create!(name: 'Grenadine')
dish1 = chef1.dishes.create!(name: 'fettucini', description: 'fettucini alfredo')
dish2 = chef1.dishes.create!(name: 'gnocci', description: 'red sauce cooked potatoes')

ingredient1 = Ingredient.create!(name: 'spaghetti noodles', calories: 241)
ingredient2 = Ingredient.create!(name: 'potatoes', calories: 110)
ingredient3 = Ingredient.create!(name: 'white sauce', calories: 300)
ingredient4 = Ingredient.create!(name: 'red sauce', calories: 280)

DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient3.id)
DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient2.id)
DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient4.id)

