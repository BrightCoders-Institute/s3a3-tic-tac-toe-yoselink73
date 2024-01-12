# frozen_string_literal: true

require_relative '../game'

describe Game do
  describe '#set_players' do
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
end
