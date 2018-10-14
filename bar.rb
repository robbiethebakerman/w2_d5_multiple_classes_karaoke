class Bar

  attr_accessor :money, :drinks

  def initialize
    @money = 0
    @drinks = []
  end

  def add_drink(drink)
    @drinks << drink
  end

  def add_money(amount)
    @money += amount
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

end
