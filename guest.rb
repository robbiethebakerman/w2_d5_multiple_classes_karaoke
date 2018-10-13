$entry_fee = 5

class Guest

  attr_reader :name, :money, :fave_song

  def initialize(name, money, fave_song)
    @name = name
    @money = money
    @fave_song = fave_song
  end

  def can_afford_entry()
    @money >= $entry_fee ? true : false
  end

end
