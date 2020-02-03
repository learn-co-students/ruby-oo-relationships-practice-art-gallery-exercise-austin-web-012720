class Painting

  attr_reader :title, :price
  attr_accessor :artist, :gallery
  
  #This is an array of all the paintings
  @@all = []

  def self.all
    @@all
  end

  def initialize(title, price, artist, gallery)
    @title = title
    @price = price
    @artist = artist
    @gallery = gallery

    self.class.all << self
  end

  def self.total_price
    self.all.map {|painting| painting.price}.sum
  end

end
