class JsonAction
  DB = "database.json"

  def self.get_users
    File.open(DB) do |file|
      return JSON.load(file)
    end
  end

  def self.save_users(users)
    File.open(DB, 'w') do |file|
      JSON.dump(users, file)
    end
  end

end
