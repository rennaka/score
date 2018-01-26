require "json"

class User
  attr_accessor :id, :name, :score

  def initialize(id,name,score)
    @id = id
    @name = name
    @score = score
  end

  def id

  end

  def name

  end

  def score

  end

  def to_json
    JSON.pretty_generate({"id": @id, "name": @name, "score": @score})
  end

  def self.average(users)
    users.map{|user| user["score"]}.inject(:+) / (users.size)
  end

end
