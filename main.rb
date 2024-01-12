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

until game.game_over?
  puts 'Jugador 1, elije una casilla'
  position = $stdin.gets.chomp.to_i
  until game.play_turn(game.player1, position)
    game.print_board
    puts 'Elige una casilla libre'
    position = $stdin.gets.chomp.to_i
  end
  game.print_board

  break if game.game_over?

  puts 'Jugador 2, elije una casilla'
  position = $stdin.gets.chomp.to_i
  until game.play_turn(game.player2, position)
    game.print_board
    puts 'Elige una casilla libre'
    position = $stdin.gets.chomp.to_i
  end
  game.print_board
end

if game.winner
  puts "#{game.winner} gano el juego"
else
  puts 'Juego empatado'
end
puts "Game Over!\n"
