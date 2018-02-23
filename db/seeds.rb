require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

Cocktail.create(name: "mojito")
Cocktail.create(name: "Black russian")
Cocktail.create(name: "Caipirinha")

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
end
