class Artist

  attr_reader :name, :years_experience
  
  #This array is an array of all the artists
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience

    self.class.all << self
  end

  def paintings
    #returns an array of all the paintings by an artist
    Painting.all.select {|painting| painting.artist == self}
  end

  def galleries
    #an array of paintings is being iterated over and accessing the gallery
    self.paintings.map{|painting| painting.gallery}
  end

  def cities
    #returns an array of all the cities that an artist has paintings in
    self.galleries.map{|painting| painting.city}.uniq
  end

  def self.total_experience
    self.all.collect {|artist| artist.years_experience}.sum
  end

  def self.most_prolific
    #this returns the artist object
    self.all.max_by do |artist|
      artist.painting.count / artist.years_experience
    end
  end

  def create_painting(title, price, gallery)
    new_painting = Painting.new(title, price, self, gallery)
  end

end
