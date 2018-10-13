$entry_fee = 5

class Guest

  attr_reader :name, :fave_song
  attr_accessor :money

  def initialize(name, money, fave_song)
    @name = name
    @money = money
    @fave_song = fave_song
  end

  def can_afford_entry()
    @money >= $entry_fee ? true : false
  end

end
