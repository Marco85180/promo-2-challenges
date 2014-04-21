def bugged_concatenate(array)
  array.inject("") { |output, element| output + element }.upcase
end

def build_1984_title
  bugged_concatenate[1984, "George Orwell"]
end