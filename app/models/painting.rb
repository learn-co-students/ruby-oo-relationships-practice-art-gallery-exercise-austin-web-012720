class Painting

  attr_reader :title, :price

  @@all = []
  def self.all
    @@all
  end 

  def initialize(title, price)
    @title = title
    @price = price
    @@all << self
  end

  def self.total_price
    sum += self.all.reduce(0) {|p| p.price}
  end 

end
