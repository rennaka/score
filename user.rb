require "json"

class User
  attr_accessor :validation_message

  def initialize
    @id = JsonAction.get_users.map{|user| user["id"]}.max + 1
  end

  def score=(val)
    @score = val.to_i if score_validation_message(val).nil?
    self.validation_message = score_validation_message(val)
  end

  def to_json
    { "id": @id, "score": @score } # { "id": @id, "name": @name, "score": @score}
  end

  def self.average(users)
    (users.map{|user| user["score"]}.inject(:+)*1.0 / (users.size)).round(1)
  end

  def score_validation_message(score)
    return ">invalid input: not a number" unless score =~ /^[0-9]+$/
    return ">invalid input: less than 100" if score.to_i > 100
  end

end
