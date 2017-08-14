require_relative("guest")


class Room

  attr_reader(:number, :capacity, :singers, :playlist, :ticket_price, :takings)
  attr_accessor(:capacity, :singers, :playlist, :ticket_price, :takings)

  def initialize(number, capacity, singers, playlist, ticket_price, takings)
    @number = number
    @capacity = capacity
    @singers = singers
    @playlist = playlist
    @ticket_price = ticket_price
    @takings = takings
  end

  def add_singer(guest)
    if @singers.count < @capacity && guest.funds >= @ticket_price
      @singers << guest
      guest.funds -= @ticket_price
      @takings += @ticket_price

    elsif guest.funds < @ticket_price
      return "I\'m sorry.  Entry costs £#{@ticket_price}.  You do not have enough money!"
    else
      return "I\'m sorry, Room #{@number} is full at the moment.   Please try later."
    end
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
