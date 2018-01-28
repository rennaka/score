class JsonAction

  def self.get_users
    File.open("database.json") do |file|
      return JSON.load(file)
    end
  end

  def self.register_user(user)
    users = JsonAction.get_users
    File.open("database.json", 'w') do |file|
      users << user.to_json
      str = JSON.dump(users, file)
    end
  end

  def self.delete_user(user)
    users = JsonAction.get_users
    File.open("database.json", 'w') do |file|
      users.delete(user)
      str = JSON.dump(users, file)
    end
  end

end
