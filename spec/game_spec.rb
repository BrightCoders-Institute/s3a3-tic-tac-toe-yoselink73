# frozen_string_literal: true

require_relative '../game'

describe Game do
  describe '#assign_players' do
    it 'when player one chose "X"' do
      game = Game.new
      game.assign_players('X')
      expect(game.player1).to eq('X')
      expect(game.player2).to eq('O')
    end

    it 'when player one choose "O"' do
      game = Game.new
      game.assign_players('O')
      expect(game.player1).to eq('O')
      expect(game.player2).to eq('X')
    end

    it 'assign uppercase symbols to players' do
      game = Game.new
      game.assign_players('o')
      expect(game.player1).to eq('O')
    end

    it 'when invalid option choose return `false`' do
      game = Game.new
      expect(game.assign_players('s')).to be false
    end
  end

  describe '#row_index' do
    it 'return index 0 when position less than 4' do
      game = Game.new
      row_index = game.row_index(1)
      expect(row_index).to eq(0)
    end

    it 'return index 1 when position greater tha 3 and less than 7' do
      game = Game.new
      row_index = game.row_index(4)
      expect(row_index).to eq(1)
    end

    it 'return index 2 when position greater than 6' do
      game = Game.new
      row_index = game.row_index(7)
      expect(row_index).to eq(2)
    end
  end
end
