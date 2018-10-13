class Room

  attr_reader :name, :capacity, :guests, :songs

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests = []
    @songs = []
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
    end
  end

    def check_out(guest)
      @guests.delete(guest)
    end

end
