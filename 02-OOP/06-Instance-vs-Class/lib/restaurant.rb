class Restaurant

  #TODO add relevant accessors if necessary

  attr_reader :name, :city, :average_rating

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @name = name
    @city = city
    @average_rating = 0
    @ratings = []
  end

  #TODO: implement #filter_by_city and #rate methods

  def self.filter_by_city(restos, city)
    city_resto = []
    restos.each do |resto|
      city_resto << resto if resto.city == city
      end
      city_resto
  end

  def rate(rating)
      @ratings << rating
      @average_rating = @ratings.reduce(:+) / @ratings.length
  end

end

# restos = []

# jules_verne = Restaurant.new("paris", "Jules Verne")
# tour_d_argent = Restaurant.new("paris", "Tour d'argent")
# bocuse = Restaurant.new("lyon", "Paul Bocuse")

# restos << jules_verne
# restos << tour_d_argent
# restos << bocuse


# p Restaurant.filter_by_city(restos, 'lyon')