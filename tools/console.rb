require_relative '../config/environment.rb'

# Artists
artist_1 = Artist.new("Mike", 100)
artist_2 = Artist.new("Leo", 25)

#galleries
texas = Gallery.new("New Texas", "Dark side of the moon")


#paintings
artist_1.create_painting("awesome pt 1", 100000000, texas)
artist_2.create_painting("good paint", 420, texas)

binding.pry
puts "Bob Ross rules."
