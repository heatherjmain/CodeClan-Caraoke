class Guest

  attr_reader(:name, :funds)
  attr_accessor(:funds)

  def initialize(name, funds)
    @name = name
    @funds = funds
  end



end
