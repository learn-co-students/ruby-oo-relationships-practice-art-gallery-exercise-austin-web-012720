class Artist

  attr_reader :name, :years_experience

  @@all = []
  def self.all
    @@all
  end 

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def paintings
    Painting.all.select {|p| p.artist == self}
  end 

  def galleries
    paintings.map {|p| p.gallery}
  end 

  def cities
    galleries.map {|c| c.city}
  end 

  def self.total_experience
    self.all.reduce(0) do |sum, artist| 
      sum + artist.years_experience
    end 
  end 

  def self.most_prolific
    self.all.max_by do |artist| 
      artist.paintings.length / artist.years_experience
    end
  end 

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end 

end
