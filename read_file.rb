require_relative "./app/game"

g = Game.new
puts "Please enter the file path"
g.read_file(gets.chomp)
puts "Output: #{g.operation_command('REPORT')}"
