class OrangeTree

  attr_accessor :year, :size, :fruit, :dead

  def initialize
  @year = 0
  @size = 0
  @fruit = 0
  @dead = false
  end

  def one_year_passes!
    unless @dead
      @year += 1
      height
      fruits
      life_cycle
    end
  end

  def height
    if @year <= 10
    @size = @year
    else @year > 10
      @size = 10
    end
  end

  def fruits
    case @year
    when 6..10
      @fruit = 100
    when 11..15
      @fruit = 200
    else
      @fruit = 0
    end
  end

  def pick_a_fruit!
    if @fruit > 0
      @fruit -= 1
    end
  end

  def dead?
    @dead
  end

  def life_cycle
    case @year
    when 0..50
      @dead = false
    when 50..100
    probability = rand(10)
      if probability <= 4
        @dead = false
      else
        @dead = true
      end
    else
      @dead = true
    end
  end

end

my_tree = OrangeTree.new
p "my tree is #{my_tree.year} year"


12.times { my_tree.one_year_passes! }

p "#{my_tree.year} years old, #{my_tree.height} meters et produit #{my_tree.fruits} et il reste #{my_tree.pick_a_fruit!}"


p my_tree.pick_a_fruit!
p my_tree.fruit