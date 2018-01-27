class JsonAction

  def self.get_users
    users = []
    File.open("database.json") do |file|
      users = JSON.load(file)
    end
    users
  end

  def self.register_user(user)
    users = JsonAction.get_users
    File.open("database.json", 'w') do |file|
      users << user.to_json
      str = JSON.dump(users, file)
    end
  end

  def self.select_user(id)
    
  end

end
