class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience

    self.class.all << self        # Better practice than calling @@all, more accurate errors after a failure
  end

  def galleries 
    self.paintings.map { |painting| painting.gallery }.uniq
  end

  def cities
    self.galleries.map { |gallery| gallery.city }.uniq
  end

  def paintings
    Painting.all.select { |painting| painting.artist == self }
  end

  def self.all
    @@all
  end

  def self.total_experience
    self.all.map { |artist| artist.years_experience }.sum
  end

  def self.most_prolific
    all.max_by { |artist| artist.paintings.count / artist.years_experience }
  end

  def create_painting(title, price, gallery)
    new_painting = Painting.new(title, price, self, gallery)
  end

end
