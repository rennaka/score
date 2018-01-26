require "json"
require "./user.rb"

p "input movement>"
input = STDIN.gets.chomp!
p input

File.open("database.json") do |j|
  users = JSON.load(j)
  p User.average(users)
end


# display
# File.open("database.json") do |j|
#   p hash = JSON.load(j)
# end
