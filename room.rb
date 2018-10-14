class Room

  attr_reader :name, :capacity, :guests, :songs
  attr_accessor :bar, :drinks_sold_from_room

  def initialize(name, capacity, bar)
    @name = name
    @capacity = capacity
    @bar = bar
    @guests = []
    @songs = []
    @drinks_sold_from_room = 0
  end

  def add_song(song)
    @songs << song
  end

  def check_in(guest)
    if @guests.length >= @capacity
      "Guest cannot be checked in. Room has reached its maximum capacity of #{@capacity}. No more guests can be checked in until one is removed."
    elsif guest.can_afford_entry == false
      "Guest cannot be checked in. Guest cannot afford entry. Guest has £#{guest.money}, which is less than the entry fee of £#{$entry_fee}."
    else
      @guests << guest
      guest.money -= $entry_fee
      @bar.money += $entry_fee
    end
  end

    def check_out(guest)
      @guests.delete(guest)
    end

    def add_money_to_bar(amount)
      @bar.add_money(amount)
    end

end
