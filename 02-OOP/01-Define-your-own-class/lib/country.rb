class Country
  def initialize(name, capital, lake)
    @name = name
    @capital = capital
    @lake = lake
    @sky = "bleu"
  end

  def capital
    "The capital of #{@name} is : #{@capital} "
  end

  def lake
    "Here are my lakes : #{@lake} above the sky is #{@sky}"
  end
end

france = Country.new('France', 'Paris', 'le lake du Bourget, le lake blanc')


puts france.capital
puts france.lake
