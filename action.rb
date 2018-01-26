require "json"

class Action

  def main
    p "input movement>"
    input = STDIN.gets.chomp!
    self.send(input)
  end

  def average
    File.open("database.json") do |j|
      users = JSON.load(j)
      puts User.average(users)
    end
    main
  end

  # display
  # File.open("database.json") do |j|
  #   p hash = JSON.load(j)
  # end

  # # create
  # File.open("database.json") do |j|
  #   users = JSON.load(j)
  #   new_user = User.new(3,"ccc",50)
  #   users << new_user.to_json
  # end

end
