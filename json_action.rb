require "./constant.rb"
require "./print.rb"

class JsonAction

  def self.get_users
    File.open(Constant::DB) do |file|
      return JSON.load(file)
    end
  end

  def self.save_users(users)
    File.open(Constant::DB, 'w') do |file|
      JSON.dump(users, file)
    end
    puts Print.green(">Successfully #{Constant::PAST[caller[0][/`([^']*)'/, 1].to_sym]} score")
  end

end
