def sum_with_while(min,max)
  #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a while..end structure
  x = min
  sum = x
    while x < max
      x += 1
      sum += x
    end
    sum
end

def sum_with_for(min,max)
  #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a for..end structure
  sum = 0
  for x in min..max
    sum += x
  end
  sum
end

def sum_recursive(min,max)
  #TODO (optional): return the sum of the integers between min and max
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
  if min > max
    raise ArgumentError, "Please check your stuff!!"
  elsif min < max
    sum = min + sum_recursive(min + 1, max)
  else
    max
  end
end

