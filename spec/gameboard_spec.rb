# frozen_string_literal: true

require './lib/gameboard'
require './lib/player'

describe Gameboard do
  let(:board) { Gameboard.new }
  let(:player) { Player.new('gabe', '☻') }

  describe '#add_disc' do
    it 'adds disc' do
      column = 5
      board.add_disc(column, player)
      expect(board.slots[column][0]).not_to eql(' ')
    end
    it 'puts disc in first open slot in column' do
      column = 5
      board.slots[column][0] = '☻'
      board.add_disc(column, player)
      expect(board.slots[column][1]).to eql('☻')
    end
  end

  describe '#column_full?' do
    it 'if column full of disks' do
      column = 4
      board.slots[column].each { board.add_disc(column, player) }
      expect(board.column_full?(column)).to eql(true)
    end
    it 'if column not full' do
      column = 4
      expect(board.column_full?(column)).to eql(false)
    end
  end
end
