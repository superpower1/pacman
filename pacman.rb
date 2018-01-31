require 'pry'

class Pacman
  @x, @y = 0
  @face = ""

  def place(x,y,face)
    @x = x
    @y = y
    @face = face
  end

  def move
    # @face will be NORTH,SOUTH, EAST or WEST
    case @face
    when 'NORTH'
      @y = @y+1
    when 'SOUTH'
      @y = @y-1
    when 'EAST'
      @x = @x+1
    when 'WEST'
      @x = @x-1
    end
  end

  def left
    case @face
    when 'NORTH'
      @face = 'WEST'
    when 'SOUTH'
      @face = 'EAST'
    when 'EAST'
      @face = 'NORTH'
    when 'WEST'
      @face = 'SOUTH'
    end
  end

  def right
    case @face
    when 'NORTH'
      @face = 'EAST'
    when 'SOUTH'
      @face = 'WEST'
    when 'EAST'
      @face = 'SOUTH'
    when 'WEST'
      @face = 'NORTH'
    end
  end

  def report
    puts "#{@x}, #{@y}, #{@face}"
  end
end

p = Pacman.new
binding.pry

puts 'end'
