def shuffle_word(a_word)
  #TODO: refactor this method
  a_word.upcase.chars.to_a.shuffle
end

def quote_prime_numbers(n)

  #TODO: refactor this method
  prime_numbers = (1..n).find_all do |num|
    dividers = (2..i-1).select {|div| num % div == 0 }
    dividers.count == 0
  end

  prime_numbers.map{ |prime_number| "#{prime_number} is prime"}

end

puts quote_prime_numbers(10)