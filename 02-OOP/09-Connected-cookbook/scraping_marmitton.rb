require 'nokogiri'
require 'open-uri'
require 'csv'


class Scraping

  attr_reader :title :rating :num_of_vote :type :preparation

  def scrap!(ingredient)

    puts 'Which ingredient do you want?'
    ingredient = gets.chomp

    response_file = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")

    doc = Nokogiri::HTML(response_file)

    doc.search('.m_search_result').each do |element|
        @title = "#{element.search('.m_search_titre_recette > a').inner_text}"
        @rating = "Rating : #{element.search('.etoile1').size} / 5".to_s
        @num_of_vote = "Nombre de vote : #{element.search('.m_search_nb_votes').inner_text}"
        @type = "#{element.search('.m_search_type_plat').inner_text}"
        @preparation =  "#{element.search('.m_search_result_part4').inner_text}"
    end
  end
end

class Controller
  def add
    @coobook.create
  end
  def delete
  end
  def get_from_marmiton
    scraper = Scraping.new
    scraper.scrap!
    scraper.title

    @cookbook.create(scraper.title, scraper.rating)
  end
end
