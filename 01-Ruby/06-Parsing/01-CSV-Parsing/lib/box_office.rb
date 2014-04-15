# Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  array = []

  CSV.foreach(file_name, encoding: "iso-8859-1:UTF-8") do |row|

    info_film = {
      name: row[0].to_s,
      year: row[1].to_i,
      earnings: row[2].to_i
    }

    array << info_film

  end

  array.delete_if { |a| a[:year] >= max_year }
  array.sort_by! {|info_film| info_film[:earnings]}.reverse!
  array.take(number)

end

puts most_successfull(2, 1990, "lib/movies.csv")