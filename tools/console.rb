require_relative '../config/environment.rb'

andy = Artist.new("Andy Warhol", 20)
patty = Artist.new("Patty cakes", 333)

new_texas = Gallery.new("New Texas", "Somewhere on Mars")

awesome = Painting.new("Awesome part 1", 100000, patty, new_texas)

binding.pry

puts "Bob Ross rules."
