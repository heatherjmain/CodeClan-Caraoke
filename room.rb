class Room

  attr_reader(:number, :capacity, :singers, :playlist)

  def initialize(number, capacity, singers, playlist)
    @number = number
    @capacity = capacity
    @singers = singers
    @playlist = playlist
  end

  def add_singer(guest)
    @singers << guest
  end

  def remove_singer(guest)
    @singers.delete(guest)
  end

  def empty_room()
    @singers.clear()
  end

  def add_song(song)
    @playlist << song
  end
end
