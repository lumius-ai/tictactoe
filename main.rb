require_relative 'lib/board'


def main()
  player = nil

  while player == nil
    puts("Choose X or O")
    p = gets.chomp.upcase()
    if p == "X" or p == "O"
      player = p
    end
  end

  game_board = Board.new(player)
  
  while game_board.check_win() == nil
    puts(game_board)
    puts("#{game_board.current_player} current move. Enter (row) (column) 0-2")
    move = gets.chomp
    move = move.split(" ")
    if move.length != 2
      puts("Move: (row) (column)")
      next
    end
    if game_board.make_move(move[0], move[1]) == false
      puts("Invalid move!")
      next
    end
  end
  puts(game_board)
  puts("#{game_board.check_win()} wins!")
end

main()