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

end
