class JsonAction
  DB = "database.json"
  
  def self.get_users
    File.open(DB) do |file|
      return JSON.load(file)
    end
  end

  def self.register_user(user)
    users = JsonAction.get_users
    File.open(DB, 'w') do |file|
      users << user.to_json
      str = JSON.dump(users, file)
    end
  end

  def self.delete_user(user)
    users = JsonAction.get_users
    File.open(DB, 'w') do |file|
      users.delete(user)
      str = JSON.dump(users, file)
    end
  end

end
