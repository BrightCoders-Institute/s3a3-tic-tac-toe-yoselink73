class Game
  def initialize(player1, player2)
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
    @player1 = player1
    @player2 = player2
  end

  def print_board
    @board.each_with_index do |row, i|
      puts row.join('|')
      puts '_ _ _' unless @board.length == i + 1
    end
  end
end
