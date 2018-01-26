class User
  attr_accessor :id, :name, :score

  def id

  end

  def name

  end

  def score

  end

  def self.average(users)
    users.map{|user| user["score"]}.inject(:+) / (users.size)
  end

end
