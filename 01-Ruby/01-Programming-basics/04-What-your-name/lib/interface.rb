require_relative "compute_name"

  #TODO:
  #- Ask the user to write a value for param
  #- Get and return the string inputted by the user

def ask_and_get(param)
  puts 'What\'s your ' + param + "?"
  gets.chomp
end

def name_from_terminal
  first_name = ask_and_get("first name")
  second_name = ask_and_get("middle name")
  last_name = ask_and_get("last name")

  compute_name(first_name, second_name, last_name)
end

full_name = name_from_terminal

#TODO: use string concatenation to build a custom message embedding the computed full_name

custom_message = "Hello " + full_name + " is there " + full_name.length.to_s + " characters"

puts custom_message

