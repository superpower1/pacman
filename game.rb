require_relative 'game_controller'
require 'pry'

class Game

  attr_accessor :game

  def initialize
    @game = GameController.new(5,5)
  end

  def start_command
    init = false
    while !init
      puts "Please use PLACE x,y,f to place to pacman"
      command = gets
      if command =~ /^PLACE [0-4],[0-4],(NORTH|SOUTH|EAST|WEST)$/
        init = true
        args = command.split(' ')[1].split(',')
        x = args[0].to_i
        y = args[1].to_i
        face = args[2]
        game.place(x,y,face)
        puts "Pacman placed, use 'MOVE,LEFT,RIGHT' to move it, use 'REPORT' to report the current coordinate"
        operation_command
      end
    end
  end

  def operation_command
    command = gets.chomp
    while command != 'exit'
      case command
      when /^PLACE [0-4],[0-4],(NORTH|SOUTH|EAST|WEST)$/
        args = command.split(' ')[1].split(',')
        x = args[0].to_i
        y = args[1].to_i
        face = args[2]
        puts "Pacman placed." if game.place(x,y,face)
      when "MOVE"
        if !game.move
          puts "Invalid movement"
        else
          puts "Pacman moved"
        end
      when "LEFT"
        game.left
        puts "Pacman changed direction"
      when "RIGHT"
        game.right
        puts "Pacman changed direction"
      when "REPORT"
        puts game.report
      else
        puts "Invalid command"
      end
      command = gets.chomp
    end
  end
end

g = Game.new
# g.start_command

binding.pry
puts 'end'
