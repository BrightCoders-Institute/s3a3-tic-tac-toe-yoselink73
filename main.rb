# frozen_string_literal: true

require_relative 'game'

game = Game.new
puts 'Jugador 1 elige entre "X" y "O" con que simbolo quieres jugar'
symbol = $stdin.gets.chomp

until game.assign_players(symbol)
  puts 'Elige una opcion correcta'
  symbol = $stdin.gets.chomp
end
puts "Jugador 1, tu simbolo es: \"#{game.player1}\""
puts "Jugador 2, tu simbolo es: \"#{game.player2}\""

game.print_board
