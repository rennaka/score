require "json"
require "./json.rb"

class Action
  attr_accessor :users

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
    p "input name>"
    name = STDIN.gets.chomp!
    p "input score>"
    score = STDIN.gets.to_i
    new_user = User.new(3,name,score)
    JsonAction.register_user(new_user)
  end

  def edit
    user = JsonAction.select_user()
  end

  def delete

  end
end
