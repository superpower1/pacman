require_relative 'pacman'
require 'pry'

class GameController
  attr_accessor :width, :height, :pacman

  def initialize(size)
    @width = size[:width]
    @height = size[:height]
    @pacman = Pacman.new
    @face_angle_hash = {
      "EAST": 0,
      "NORTH": 90,
      "WEST": 180,
      "SOUTH": 270
    }
  end

  def angle_to_face(angle)
    @face_angle_hash.key(angle)
  end

  def face_to_angle(face)
    @face_angle_hash[face.to_sym]
  end

  def report
    x = pacman.x
    y = pacman.y
    angle = pacman.angle
    face = angle_to_face(angle)
    "#{x},#{y},#{face}"
  end

  def place(x,y,face)
    if x>=width||y>=height||x<0||y<0
      return false
    end
    pacman.x = x
    pacman.y = y
    if face =~ /^(NORTH|SOUTH|EAST|WEST)$/
      angle = face_to_angle(face)
    else
      return false
    end
    pacman.angle = angle
  end

  def move
    case pacman.angle
    when 0
      return false if pacman.x + 1 >= width
      pacman.x= pacman.x + 1
    when 90
      return false if pacman.y + 1 >= height
      pacman.y= pacman.y + 1
    when 180
      return false if pacman.x - 1 < 0
      pacman.x= pacman.x - 1
    when 270
      return false if pacman.y - 1 < 0
      pacman.y= pacman.y - 1
    end
  end

  def left
    pacman.angle += 90
    if pacman.angle >= 360
      pacman.angle -= 360
    end
  end

  def right
    pacman.angle -= 90
    if pacman.angle < 0
      pacman.angle += 360
    end
  end

end

# binding.pry
# puts "end"
