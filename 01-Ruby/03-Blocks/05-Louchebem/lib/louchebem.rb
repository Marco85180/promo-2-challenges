# Encoding: utf-8

def insert_l(word)
vowels = %w(a e y u i o)
  if vowels.include? word[0]
  "l" + word
  end
end

def suffixes(word)
suffixes = %w(em, é, ji, oc, ic, uche, ès)
suffixes[rand(0..suffixes.lenght-1)]
end

def louchebemize(word)
  #TODO: implement your louchebem translator
  if word.length == 1
    louchebemize_word = word
  else
    if

end

puts louchebemize_word(salut)

