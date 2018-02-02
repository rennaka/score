require "json"
require "./json.rb"

class Action
  attr_accessor :users

  def initialize
    @users = JsonAction.get_users&.sort_by{|user| user["id"]} || []
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
    new_user = User.new()
    create_user(new_user)
  end

  def edit
    puts ">Please enter #{caller[0][/`([^']*)'/, 1]} line number"
    user = find_user(STDIN.gets.to_i)
    delete_user(user)
    new_user = User.new()
    new_user.id = user["id"]
    create_user(new_user)
  end

  def delete
    puts ">Please enter #{caller[0][/`([^']*)'/, 1]} line number"
    user = find_user(STDIN.gets.to_i)
    delete_user(user)
    puts ">Successfully deleted score"
  end

  private

  def display(user)
    puts "#{user["id"]}.#{user["score"]}"
  end

  def delete_user(user)
    @users.delete(user)
    JsonAction.save_users(@users)
  end

  def create_user(user)
    puts "Please enter the score>"
    user.score = STDIN.gets.chomp!
    return puts user.validation_message if user.validation_message
    @users << user.to_json
    JsonAction.save_users(@users)
    puts ">Successfully #{caller[0][/`([^']*)'/, 1]} score"
  end

  def find_user(id)
    @users.detect{|user| user["id"] == id}
  end

  # def score
  #   loop do
  #     puts "Please enter the score>"
  #     tmp_score = STDIN.gets.chomp!
  #     return tmp_score.to_i if score_validation_message(tmp_score).nil?
  #     puts score_validation_message(tmp_score)
  #   end
  # end
  #
  # def score_validation_message(score)
  #   return ">invalid input: not a number" unless score =~ /^[0-9]+$/
  #   return ">invalid input: less than 100" if score.to_i > 100
  # end

end
