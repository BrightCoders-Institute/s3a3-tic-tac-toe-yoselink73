# frozen_string_literal: true

# Create class to control the game
class Game
  attr_accessor :player1, :player2, :board, :winner

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

  def game_over?
    check_rows
    check_columns
    check_diagonals
    return true if @winner
    return true if full_board?

    false
  end

  def full_board?
    string_board = ''
    @board.each do |row|
      string_board += row.join('')
    end
    string_board.chars.all? { |char| %w[O X].include? char }
  end

  def check_rows
    @board.each do |row|
      @winner = 'O' if row.join('').chars.all? { |char| char == 'O' }
      @winner = 'X' if row.join('').chars.all? { |char| char == 'X' }
    end
  end

  def check_columns
    3.times do |column|
      column_string = ''
      3.times do |row|
        column_string += @board[row][column]
      end
      @winner = 'O' if column_string.chars.all? { |char| char == 'O' }
      @winner = 'X' if column_string.chars.all? { |char| char == 'X' }
    end
  end

  def check_diagonals
    first_diagonal = ''
    3.times do |index|
      first_diagonal += @board[index][index]
    end
    @winner = 'O' if first_diagonal.chars.all? { |char| char == 'O' }
    @winner = 'X' if first_diagonal.chars.all? { |char| char == 'X' }

    second_diagonal = ''
    3.times do |row|
      column = 2 - row
      second_diagonal += @board[row][column]
    end
    @winner = 'O' if second_diagonal.chars.all? { |char| char == 'O' }
    @winner = 'X' if second_diagonal.chars.all? { |char| char == 'X' }
  end
end
