# frozen_string_literal: true

# Create class to control the game
class Game
  attr_accessor :player1, :player2, :board

  def initialize
    @board = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
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

  def play_turn(player, position)
    current_value = @board[row_index(position)][column_index(position)]
    return false if %w[O X].include? current_value

    @board[row_index(position)][column_index(position)] = player
  end

  def row_index(position)
    return 0 if position < 4
    return 1 if position > 3 && position < 7

    2 if position > 6
  end

  def column_index(position)
    return 0 if [1, 4, 7].include? position
    return 1 if [2, 5, 8].include? position

    2 if [3, 6, 9].include? position
  end
end
