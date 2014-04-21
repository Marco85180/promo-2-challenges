todo = {}

while true

  puts "Que devez-vous faire aujourd'hui?"
  task = gets.chomp.to_s

  break if task == ""

  begin
  puts "Quelle priorité?"
  priority = gets.chomp.to_i
  end while!(1..10)include?(priority)

todo[task] = priority

end

puts 'Here are your tasks :'

todo.each do|key, value|
 puts "- #{key} à un niveau de priorité : #{'*'*value}"
end

puts "\n-----------------------------"
puts 'What is your minimum urgency'
puts "-----------------------------"

urgency = gets.chomp.to_i

todo.each do |key, value|
  if value >= urgency
  puts "#{key} est supérieur à ton niveau d'urgence car il est à #{value}"
  end
end


puts "\n Par ordre de priorité, cela donne: "

tasks = todo.sort_by {|key, value| value}.reverse

tasks.each_with_index {|a, i| puts "#{i+1} #{a.first} : #{a.last}"} # #{a[0]} : #{a[1]}

#tasks.each do




