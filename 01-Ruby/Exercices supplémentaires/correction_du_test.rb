courses = {
  'yaourt' => 3,
  'légumes' => 5,
  'viande' => 7,
  'glace' => 4
}

panier = []

while true
  puts 'Here are the available porduct'
  courses.each {|product, price| puts "#{product}: #{price}€"}

  puts 'What do you want to buy?'
  product = gets.chomp

  break if product == ""

  if courses.has_key?(product)
    panier << product
  else
    puts 'this product is not in store, sorry!!'
  end

  puts '--------------'
end

puts 'Here is your order:'

total = 0
panier.each do |product|
  total += courses[product]
end

puts panier.join(', ')
puts "Total price: #{total}€"