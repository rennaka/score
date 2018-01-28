require "json"

class User
  attr_accessor :id, :name, :score

  def initialize(score)
    @id = JsonAction.get_users.sort_by{|user| user["id"]}.map{|user| user["id"]}.last + 1
    # @name = name
    @score = score
  end

  def id

  end

  def name

  end

  def score

  end

  def to_json
    { "id": @id, "score": @score } # { "id": @id, "name": @name, "score": @score}
  end

  def self.average(users)
    (users.map{|user| user["score"]}.inject(:+)*1.0 / (users.size)).round(1)
  end

end
