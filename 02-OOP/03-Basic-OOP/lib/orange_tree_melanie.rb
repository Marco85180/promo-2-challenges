class OrangeTree
  attr_reader :size, :age, :fruits, :life

  def initialize
    @size = 0
    @age = 0
    @fruits = 0
    @life = true
  end

  def one_year_passes
    @age += 1
    grows
    produces_fruits
    is_dead?
  end

  def grows
    if @age <= 10
      @size += 1
    end
  end

  def produces_fruits
  #de 5 à 9 = 100 par an
  # de 10 à 15 = 200 par an
  # de 15 a apres = rien

  end
  def is_dead?
    wheif @age >
    if @age >= 5 && @age <= 9
     @fruits = 100
    elsif @age >= 10 && @age <= 15
      @fruit = 200
    end
       #de 0 à 4 = 0 100
    false
  end

  def pick_a_fruit
    @fruits -= 1
  end


end
end

my_tree = OrangeTree.new
p "#{my_tree.age} years old, #{my_tree.size} meters"

10.times { my_tree.one_year_passes }
p "#{my_tree.age} years old, #{my_tree.size} meters et produit#{my_tree.fruits} orange et il est #{@life}"

my_tree.pick_a_fruit
p "#{my_tree.fruits}"

#my_tree.isdead?
#p "#{my_tree.life}"

  # production orange :


  # def pour prendre un fruit

  # def pour compter les fruits pris

  ########################################correction############################