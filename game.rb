require_relative 'game_controller'
require 'pry'

class Game

  attr_accessor :game

  def initialize
    @game = GameController.new(5,5)
  end

  def command_line_interface
    init = false
    comment = ""
    while !init
      puts "Please use PLACE x,y,f to place to pacman"
      command = gets.chomp
      if command =~ /^PLACE [0-4],[0-4],(NORTH|SOUTH|EAST|WEST)$/
        init = true
        operation_command(command)
        puts "Pacman placed, use 'MOVE,LEFT,RIGHT' to move it, use 'REPORT' to report the current position"
      end
    end
    command = gets.chomp
    while command != 'exit'
      if feedback = operation_command(command)
        puts feedback
      else
        puts 'Invalid command'
      end
      command = gets.chomp
    end
  end

  def read_file(file_path)
    File.open(file_path, "r") do |f|
      start = false
      f.each_line do |line|
        if line =~ /^PLACE [0-4],[0-4],(NORTH|SOUTH|EAST|WEST)$/
          start = true
        end
        if start && feedback = operation_command(line.chomp)
          puts feedback
        else
          puts 'Invalid command'
        end
      end
    end
  end

  def operation_command(command)
    case command
    when /^PLACE [0-4],[0-4],(NORTH|SOUTH|EAST|WEST)$/
      args = command.split(' ')[1].split(',')
      x = args[0].to_i
      y = args[1].to_i
      face = args[2]
      if game.place(x,y,face)
        return "Pacman Placed"
      else
        return false
      end
    when "MOVE"
      if game.move
        return "Move foward"
      else
        return false
      end
    when "LEFT"
      game.left
      return "Turn left"
    when "RIGHT"
      game.right
      return "Turn right"
    when "REPORT"
      game.report
    else
      return false
    end
  end
end

g = Game.new
# g.command_line_interface


binding.pry
puts 'end'
