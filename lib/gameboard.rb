# frozen_string_literal: true

require_relative 'player.rb'

# board used to place tokens onto
class Gameboard
  attr_accessor :slots
  def initialize
    @slots = build_board
  end

  def build_board
    Array.new(7) { Array.new(6, ' ') }
  end

  # prints out the slots to appear like a board
  def display
    display_string = +"\n"

    5.downto(0) do |row|
      display_string << "+---+---+---+---+---+---+---+\n"
      0.upto(6) do |column|
        display_string << "| #{@slots[column][row]} "
      end
      display_string << "|\n"
    end
    display_string << "+---+---+---+---+---+---+---+\n"
    display_string << '  1   2   3   4   5   6   7'

    puts display_string
  end

  # given column as input , places token in first open slot of that column
  def add_disc(column, player)
    i = 0
    i += 1 until @slots[column][i] == ' '
    @slots[column][i] = player.disc
  end

  def column_full?(column)
    @slots[column].each do |slot|
      return false if slot == ' '
    end
    true
  end
end

game = Gameboard.new
player = Player.new('bro', '☻')
game.add_disc(3, player)
game.add_disc(3, player)
game.display
