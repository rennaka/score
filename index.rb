require "json"
require "./user.rb"
require "./action.rb"

# 本番用
# Action.new().send(ARGV[0])

# 開発用
while true
  Action.new().main
end
