class JsonAction

  def self.get_users
    users = []
    File.open("database.json") do |j|
      users = JSON.load(j)
    end
    users
  end

end
