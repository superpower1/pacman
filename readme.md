# Pacman Simulator
This is a command line ruby app that simulate the movement of Pacman

## Install
1. If you haven't installed ruby, please follow the steps of  https://www.ruby-lang.org/en/documentation/installation/ to install ruby (This app is built under version 2.4.3)
2. `ruby game.rb` to run the simulator

## Intro
After you run the app, it will create a 5*5 game board (bottom left corner is the origin(0,0)).

This simulator accepts following commands
```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```
* `PLACE X,Y,F` is to place the pacman onto the game board, 'X,Y' will be the coordinate and 'F' is the facing of the pacman. X and Y should be between 0 and 4, 'F' should be one of 'NORTH', 'SOUTH', 'EAST' and 'WEST'. *Notice:* Any commands that is not in this form will be ignored.  
* `MOVE` is to move the pacman one step foward depends on the facing. *Notice:* Any commands that will move the pacman out of the game board will be ignored.
* `LEFT` is to make a left turn (If the pacman is facing south, left turn will change the facing to east).
* `RIGHT` is to make a right turn.
* `REPORT` is to report the current position and facing of the pacman.

The first command should be 'PLACE', any other commands before place will be ignored.

## Example
1.
```
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```
2.
```
PLACE 3,3,EAST
MOVE
REPORT
Output: 4,3,EAST
```
3.
```
PLACE 0,0,NORTH
MOVE
MOVE
RIGHT
MOVE
REPORT
Output: 2,1,EAST
```
## Test
