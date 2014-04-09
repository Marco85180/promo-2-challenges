require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.

puts "WTF?"
begin
  print "> "
  your_message = gets.chomp
  puts coach_answer_enhanced(your_message)

end until your_message == "I am going to work right now SIR !"

puts "Great!! Bye"