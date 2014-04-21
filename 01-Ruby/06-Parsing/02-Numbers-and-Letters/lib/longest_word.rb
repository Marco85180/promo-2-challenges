require 'open-uri'
require 'json'
require 'date'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  (0...grid_size).map { ('A'..'Z').to_a[rand(26)] }
end

def get_translation(word)
  my_search = open("http://api.wordreference.com/0.8/80143/json/enfr/#{word}").read
  hash = JSON.parse(my_search)
    if hash["Error"]
      raise StandardError.new("Error ! No translation available. This word does'nt exist")
    else
      translation = hash["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
    end
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  result = {}
  check_letters(grid, attempt)
  result[:time] = (end_time - start_time).to_i
  begin
    result[:translation] = get_translation(attempt).to_s
  rescue StandardError => e
    puts e.message
  end
  result[:message] = "Well Done"
  result
end

def check_letters(grid, word)
  word.upcase.chars.each do |letter|
    if grid.include?(letter)
      index = grid.index(letter)
      grid.delete_at(index)
    else
      puts "This letter #{letter} does\'nt exist in the grid"
    end
  end
end
