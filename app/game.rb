require_relative 'game_controller'

class Game

  attr_accessor :game_controller

  def initialize
    game_board_size = {
      width: 5,
      height: 5
    }
    @game_controller = GameController.new(game_board_size)
  end

  def place_command
    /^PLACE [0-4],[0-4],(NORTH|SOUTH|EAST|WEST)$/
  end

  def operation_command(command)
    case command
    when place_command
      args = command.split(' ')[1].split(',')
      x = args[0].to_i
      y = args[1].to_i
      face = args[2]
      if game_controller.place(x,y,face)
        return "Pacman Placed"
      else
        return false
      end
    when "MOVE"
      if game_controller.move
        return "Move foward"
      else
        return false
      end
    when "LEFT"
      game_controller.left
      return "Turn left"
    when "RIGHT"
      game_controller.right
      return "Turn right"
    when "REPORT"
      game_controller.report
    else
      return false
    end
  end

  def command_line_interface
    init = false
    comment = ""
    while !init
      puts "Please use PLACE x,y,f to place to pacman"
      command = gets.chomp
      if command =~ place_command
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
    begin
      File.open(file_path, "r") do |f|
        start = false
        f.each_line do |line|
          if line =~ place_command
            start = true
          end
          if start && feedback = operation_command(line.chomp)
            puts feedback
          else
            puts 'Invalid command'
          end
        end
      end
    rescue => err
      puts "#{err}"
    end
  end

end
