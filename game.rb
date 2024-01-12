# frozen_string_literal: true

# Create class to control the game
class Game
  attr_accessor :player1, :player2

  def initialize
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def print_board
    @board.each_with_index do |row, i|
      puts row.join('|')
      puts '_ _ _' unless @board.length == i + 1
    end
  end

  def assign_players(initial_symbol)
    initial_symbol = initial_symbol.upcase
    return false unless %w[O X].include? initial_symbol

    @player1 = initial_symbol
    @player2 = @player1 == 'O' ? 'X' : 'O'
  end
end
