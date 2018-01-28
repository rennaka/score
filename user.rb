require "json"

class User
  attr_accessor :id, :name, :score

  def initialize(id,score)
    @id = id
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
    { "id": @id, "score": @score} # { "id": @id, "name": @name, "score": @score}
  end

  def self.average(users)
    (users.map{|user| user["score"]}.inject(:+)*1.0 / (users.size)).round(1)
  end

end
