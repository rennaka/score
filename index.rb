require "json"
require "./user.rb"
require "./action.rb"

while true
  Action.new().main
end
