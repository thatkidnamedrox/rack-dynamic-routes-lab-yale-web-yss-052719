class Item
  attr_accessor :name, :price

  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
  end
end
