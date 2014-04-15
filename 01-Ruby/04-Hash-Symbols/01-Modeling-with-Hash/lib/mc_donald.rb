PRODUCTS = {
  "Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170
}

MEAL = {
   "Happy Meal" => PRODUCTS["Cheese Burger"] + PRODUCTS["French fries"] + PRODUCTS["Coca"],
   "Best Of Big Mac" => PRODUCTS["Big Mac"] + PRODUCTS["French fries"] + PRODUCTS["Coca"],
   "Best Of Royal Cheese" => PRODUCTS["Royal Cheese"] + PRODUCTS["Potatoes"] + PRODUCTS["Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  PRODUCTS[burger] + PRODUCTS[side] + PRODUCTS[beverage]
end

def calories_counter(*orders)
  #orders == ["Happy meal", "Cheese Burger", "Potatoes", "Coca", "Sprite"]
  #TODO: return number of calories for a less constrained order
  sum = 0
  orders.each do |aliment|
    if MEAL[aliment]
      sum += MEAL[aliment]
    elsif PRODUCTS[aliment]
     sum += PRODUCTS[aliment]
    end
  end
  sum
end