require("pry")

$entry_fee = 5

class Guest

  attr_reader :name, :fave_song, :drinks_purchased
  attr_accessor :money

  def initialize(name, money, fave_song)
    @name = name
    @money = money
    @fave_song = fave_song
    @drinks_purchased = 0
  end

  def can_afford_entry()
    @money >= $entry_fee ? true : false
  end

  def cheer_fave_song(room)
    "OMG OMG OMG I love this song!" if room.songs.include?(@fave_song)
  end

  def buy_drink(room, drink)
    if @money < drink.cost
      "#{@name} cannot afford the drink. They have £#{@money} and the drink is £#{drink.cost}."
    elsif room.bar.drinks.include?(drink) == false
      "The bar does not have #{drink.type}."
    else
      @money -= drink.cost
      room.add_money_to_bar(drink.cost)
      room.bar.remove_drink(drink)
      room.drinks_sold_from_room += 1
      @drinks_purchased += 1
    end
  end

end
