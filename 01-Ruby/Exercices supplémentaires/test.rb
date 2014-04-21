
# Produits : yaourt : 3e
#            légumes : 5e
#            viande : 7e
#             glace : 4e


courses = {
  "yaourt" => 3,
  "légumes" => 5,
  "viande" => 7,
  "glace" => 4
}

panier = []

begin
puts panier.empty? ? "Hello, what do you want to buy mister?" : "Do you want anything else"
aliments = gets
aliments.chomp! if aliments

panier << aliments if aliments != ""

end while aliments != ""

last_aliments = panier.last
premier_aliments = panier [0..-2].join(", ")



total = 0
panier.each do |product|
  total += courses[product]
end

puts "Vous avez achetez des #{premier_aliments} and #{last_aliments} et vous en avez pour #{total}€"
