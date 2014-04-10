def sum_odd_indexed(array)
  # TODO: computes the sum of elements at odd indices (1, 3, 5, 7, etc.)
  #       You should make use Enumerable#each_with_index
  sum = 0
  array.each_with_index do |element, i|
    if i.odd?
      sum += element
    end
  end
  sum
end

def even_numbers(array)
  # TODO: Return the even numbers from a list of integers.
  #       You should use Enumerable#select
    array_of_even_numbers = array.select do |num| num.even?
  end
  array_of_even_numbers
end

def short_words(array, max_length)
  # TODO: Take and array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
  array_short_word = array.reject do |element|
    element.length > max_length
  end
  array_short_word
end

def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
  array_first_under = array.find do |element|
    element < limit
  end
  array_first_under
end

def add_bang(array)
  # TODO: Take an array of strings and return a new array with "!" appended to each string.
  #       You should use Enumerable#map
  array_add_bang = array.map do |element|
    element + "!"
  end
  array_add_bang
end

def product(array)
  # TODO: Calculate the product of an array of numbers.
  #       You should use of Enumerable#reduce
  array.reduce(:*)
end

def sorted_pairs(array)
  # TODO: Reorganize an array into slices of 2 elements, and sort each slice alphabetically.
  #       You should make use of Enumerable#each_slice
  sorted_pairs = []
  array.each_slice(2) { |element| sorted_pairs << element.sort }
  sorted_pairs
end

