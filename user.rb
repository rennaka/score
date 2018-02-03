require "json"

class User
  attr_accessor :id, :name, :validation_message

  def initialize(id = nil,name = nil)
    @id = id || (JsonAction.get_users&.map{|user| user["id"]}&.max || 0) + 1
    @name = name
  end

  def name=(val)
    @name = val if name_validation_message(val).nil?
    self.validation_message = name_validation_message(val)
  end

  def score=(val)
    @score = val.to_i if score_validation_message(val).nil?
    self.validation_message = score_validation_message(val)
  end

  def has_validation_error?
    !self.validation_message.nil?
  end

  def to_json
    { "id": @id, "name": @name, "score": @score }
  end

  def name_validation_message(name)
    return ">invalid input: should not be blank" if name.empty?
  end

  def score_validation_message(score)
    return ">invalid input: not a number" unless score =~ /^[0-9]+$/
    return ">invalid input: less than 100" if score.to_i > 100
  end

  def self.average(users)
    users.empty? ? 0 : (users.map{|user| user["score"]}.inject(:+)*1.0 / (users.size)).round(1)
  end
end
