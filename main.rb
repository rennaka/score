require "json"

p "input movement>"
input = STDIN.gets
p input

File.open("database.json") do |j|
  p hash = JSON.load(j)
end


# display
# File.open("database.json") do |j|
#   p hash = JSON.load(j)
# end
