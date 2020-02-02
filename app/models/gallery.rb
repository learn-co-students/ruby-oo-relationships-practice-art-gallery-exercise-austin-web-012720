class Gallery

  attr_reader :name, :city

  @@all = []
  def self.all
    @@all
  end 

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def paintings
    # all the paintings in specific gallery
    Paintings.all.select {|p| p.gallery == self}
  end 

  def artists
    # all the artists within a gallery
    # first determined by all the paintings
    # more paintings so filter those first - see above
    paintings.map {|paint| paint.artist}
  end 

  def artist_names
    artists.map {|artist| artist.name}
  end 

  def most_expensive_painting
    paintings.max_by {|painting| painting.price}
  end

end
