# Connect Four Project

The goal of this project is to implement [Connect Four](https://en.wikipedia.org/wiki/Connect_Four) using Ruby and [TDD (Test-Driven Development)](https://en.wikipedia.org/wiki/Test-driven_development).

Test-Driven Development follows this cycle:

1. Add a Test

2. Run all Tests -- the new Test should Fail

3. Write the Code for the Test to Pass

4. Run Tests

5. Refactor

6. Repeat

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/testing-ruby).


## Pre-Project Thoughts

This will be my first project developing fully with TDD-style. 
The part that I think will be challenging to implement will be checking for win conditions since there are so many permutations.
Im thinking a search function to look at all nearby nodes for an inserted 'disc', and for all nearby nodes that are of equal value, search in the same direction to see if there are four in a row.

### Basic Project Structure - this is just of the top of my head, more methods may need to be added for proper functionality

```ruby
# gameboard.rb
class GameBoard
	instance variables:
		@slots: is an array of column arrays
    
	methods: 
		display: prints board into terminal
		add_disc: adds player disk to lowest available slot in chosen column.
		column_full?: check if column is full before player places a token
		board_full?: check if board is filled with tokens
    
# player.rb
class Player
	instance variables:
		@name: player name
		@disk: their chosen disk
	methods: 
		take_turn: gets input to pass to GameBoard.add_disc
		valid_input?: will reject user input if its unusable
		computer_turn: may include an algorithm for cpu player to make turns for 1 player games.
    
# game.rb 
class Game
	instance variables:
		@board:	instance of gameboard class
		@player1: instance of player class
		@player2: instance of player class
		@player_turn
    
	methods:
		start_game: displays the title, board, and instructions then runs main game loop
			title: displays an ASCII art title 
			
			@board.display: method in gameboard class
      
			instructions: displays the game instructions
      
			turns: starts a loop that changes @player_turn value every turn and checks for win scenario
				turn: has @player1/@player2 take_turn and add_disc to @board
				over?: checks after every turn and throws true if game is won? or draw?, otherwise returns false and loop continues
          
		won?: checks for win scenarios, for every added disc, it will check all discs at distance = 1 if they are the same, if so:
					    it will check in the same direction to see if there are 4 in a row, if so, win conditions are met
		draw?: if @board is full and no winner exists, game is a draw
		results: displays the results of game--winner if won? is true otherwise game is a draw
      

# play.rb
  script:
    asks for player names 
    creates instance of Game class with names
    then starts the game 
```
