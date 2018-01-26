require "json"
require "./user.rb"

p "input movement>"
input = STDIN.gets.chomp!
p input

# create
File.open("database.json") do |j|
  users = JSON.load(j)
  new_user = User.new(3,"ccc",50)
  puts new_user.to_json
end

# average
# File.open("database.json") do |j|
#   users = JSON.load(j)
#   p User.average(users)
# end

# display
# File.open("database.json") do |j|
#   p hash = JSON.load(j)
# end
