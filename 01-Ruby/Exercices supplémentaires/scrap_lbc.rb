require 'open-uri'
require 'nokogiri'

puts "what do you want?"
product = gets.chomp
html_file = open("http://www.leboncoin.fr/annonces/offres/ile_de_france/?q=#{product}")
html_doc = Nokogiri::HTML(html_file)

results = []

html_doc.search('.lbc').each do |element|
    title = element.search('.title').inner_text.strip
    category =  element.search('.category').inner_text.strip
    price = element.search('.price').inner_text.strip.match(/\d+/)[0].to_i

    annonce = {
      title: title,
      category: category,
      price: price
    }

    results << annonce
end

#p results

def average(products)
  resultat = products.map {|annonce| annonce[:price] }
  sum = resultat.reduce(:+) / resultat.length.to_i
end

puts average(results)

