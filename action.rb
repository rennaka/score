require "json"
require "./json.rb"

class Action
  attr_accessor :users

  def initialize
    @users = JsonAction.get_users.sort_by{|user| user["id"]}
  end

  def main
    puts "input movement>"
    input = STDIN.gets.chomp!
    self.send(input)
  end

  def average
    puts">Score Average: #{User.average(@users)}"
  end

  def read
    puts ">Show all scores"
    @users.each do |user|
      display(user)
    end
  end

  def create
    # p "input name>"
    # name = STDIN.gets.chomp!
    p "Please enter the score>"
    score = STDIN.gets.to_i
    new_user = User.new(3,score)
    JsonAction.register_user(new_user)
  end

  def edit
    user = JsonAction.select_user()
  end

  def delete
    puts ">Please enter delete line number"
    delete_line = STDIN.gets.to_i
    JsonAction.delete_user(delete_line)
  end

  private

  def display(user)
    puts "#{user["id"]}.#{user["score"]}"
  end
end
