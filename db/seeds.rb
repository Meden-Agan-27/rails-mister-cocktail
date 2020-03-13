# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating ingredients'
Dose.destroy_all
Cocktail.destroy_all

require 'open-uri'
require 'json'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
parsed_ingredients = JSON.parse(ingredient_serialized)
array_of_ingredients = parsed_ingredients['drinks']
array_of_ingredients.each do |ingredient_hash|
  ingredient = Ingredient.new(name: ingredient_hash['strIngredient1'])
  ingredient.save!
end
