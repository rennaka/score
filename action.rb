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
    new_user = User.new(new_id,score)
    JsonAction.register_user(new_user)
    puts ">Successfully created score"
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

  def score
    loop do
      p "Please enter the score>"
      tmp_score = STDIN.gets.chomp!
      return tmp_score.to_i if score_validation_message(tmp_score).nil?
      puts score_validation_message(tmp_score)
    end
  end

  def score_validation_message(score)
    return ">invalid input: not a number" unless score =~ /^[0-9]+$/
    return ">invalid input: less than 100" if score.to_i > 100
  end

  def new_id
    @users.map{|user| user["id"]}.last + 1
  end
end
