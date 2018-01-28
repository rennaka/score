require "json"
require "./user.rb"
require "./action.rb"

Action.new().send(ARGV[0])

# while true
#   Action.new().main
# end
