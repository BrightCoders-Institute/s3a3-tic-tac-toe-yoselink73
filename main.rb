# frozen_string_literal: true

require_relative 'game'

puts 'Jugador 1 elige entre "X" y "O" con que simbolo quieres jugar'
player1 = $stdin.gets.chomp.upcase
player2 = player1 == 'O' ? 'X' : 'O'
puts "Jugador 2, tu simbolo es: \"#{player2}\""

game = Game.new(player1, player2)
game.print_board
