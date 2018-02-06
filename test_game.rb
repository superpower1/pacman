require_relative 'game'
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_operation_command
    game = Game.new
    game.operation_command('PLACE 0,0,NORTH')
    assert_equal("0,0,NORTH", game.operation_command('REPORT'))
    game.operation_command('MOVE')
    assert_equal("0,1,NORTH", game.operation_command('REPORT'))
    game.operation_command('RIGHT')
    assert_equal("0,1,EAST", game.operation_command('REPORT'))
    game.operation_command('MOVE')
    assert_equal("1,1,EAST", game.operation_command('REPORT'))
    game.operation_command('PLACE 6,6,SOUTH')
    assert_equal("1,1,EAST", game.operation_command('REPORT'))
    game.operation_command('PLACE 0,0,WEST')
    game.operation_command('MOVE')
    assert_equal("0,0,WEST", game.operation_command('REPORT'))
  end

  def test_read_file
    game = Game.new
    game.read_file('./test_case/case1.txt')
    assert_equal("0,0,EAST", game.operation_command('REPORT'))
    game.read_file('./test_case/case2.txt')
    assert_equal("0,2,WEST", game.operation_command('REPORT'))
    game.read_file('./test_case/case3.txt')
    assert_equal("0,0,SOUTH", game.operation_command('REPORT'))
    game.read_file('./test_case/case4.txt')
    assert_equal("4,4,EAST", game.operation_command('REPORT'))
  end
end
