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
    set_score(new_user)
    return puts new_user.validation_message if new_user.has_validation_error?
    set_name(new_user)
    return puts new_user.validation_message if new_user.has_validation_error?
    @users << new_user.to_json
    JsonAction.save_users(@users)
  end

  def edit
    puts ">Please enter #{caller[0][/`([^']*)'/, 1]} line number"
    user = find_user(STDIN.gets.to_i)
    new_user = User.new()
    new_user.id = user["id"]
    # set_name(new_user)
    # return puts new_user.validation_message if new_user.has_validation_error?
    set_score(new_user)
    return puts new_user.validation_message if new_user.has_validation_error?
    @users[@users.index(user)] = new_user.to_json
    JsonAction.save_users(@users)
  end

  def delete
    puts ">Please enter #{caller[0][/`([^']*)'/, 1]} line number"
    user = find_user(STDIN.gets.to_i)
    @users.delete(user)
    JsonAction.save_users(@users)
  end

  private

  def display(user)
    puts "#{user["id"]},#{user["name"]},#{user["score"]}"
  end

  def set_score(user)
    puts "Please enter the score>"
    user.score = STDIN.gets.chomp!
  end

  def set_name(user)
    puts "Please enter the name>"
    user.name = STDIN.gets.chomp!
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
