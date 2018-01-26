require "json"
require "./json.rb"

class Action

  def initialize
    @users = JsonAction.get_users
  end

  def main
    p "input movement>"
    input = STDIN.gets.chomp!
    self.send(input)
  end

  def average
    puts User.average(@users)
  end

  def display
    p @users
  end

  def create
    new_user = User.new(3,"ccc",50)
    p @users << new_user.to_json
  end

  def delete

  end
end
