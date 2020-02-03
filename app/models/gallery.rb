class Gallery

  attr_reader :name, :city

  #returns an array of all the galleries
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, city)
    @name = name
    @city = city

    self.class.all << self
  end

  def paintings
    #returns and array of paintings
    Painting.all.select do |painting| 
      painting.gallery == self
    end
  end

  def artists
    self.paintings.map do |painting|
      painting.artists
    end.uniq
  end

  def artist_names
    self.artists.map do |artist|
      artist.name
    end
  end

  def most_expensive_painting
    self.paintings.max_by do |painting|
      painting.price
    end
  end

end
