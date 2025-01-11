require_relative 'grid'
require_relative 'player'

class Game
  def initialize
    @current_player_idx = 0
    @players = [Player.new('X'), Player.new('O')]
    @grid = Grid.new
  end

  def did_player_win?(player)
    # Check rows for win
    for row in 0...3
      if @grid.cells[row].all? { |cell| cell == player.icon }
        return true
      end
    end

    # Check columns for win (make sure cells are the same and not nil)
    for col in 0...3
      if @grid.cells[0][col] == @grid.cells[1][col] && @grid.cells[1][col] == @grid.cells[2][col] && @grid.cells[0][col] == player.icon
        return true
      end
    end

    # Check diagonals for win
    if @grid.cells[0][0] == @grid.cells[1][1] && @grid.cells[1][1] == @grid.cells[2][2] && @grid.cells[0][0] == player.icon
      return true
    end
    if @grid.cells[2][0] == @grid.cells[1][1] && @grid.cells[1][1] == @grid.cells[0][2] && @grid.cells[2][0] == player.icon
      return true
    end
    
    return false
  end

  def did_game_draw?
    @grid.cells.all? { |row| row.all? { |cell| !cell.nil? } }
  end

  def play
    # Empty board print before game loop
    @grid.print_board

    loop do
      cur_player = @players[@current_player_idx]
      puts "Player #{cur_player.icon}'s turn!"
      # place marker for current player
      play_player_turn(cur_player)

      @grid.print_board
      
      # check win & draw
      if did_player_win?(cur_player)
        puts "Player #{cur_player.icon} wins"
        return
      elsif did_game_draw?
        puts "It's a draw..."
        return
      end

      # Alternate b/w players w/ XOR to toggle b/w indices 0 and 1
      @current_player_idx ^= 1
    end
  end

  def play_player_turn(player)
    loop do
      row, col = player.get_play_position
      if row.between?(0, 2) && col.between?(0, 2) && @grid.cells[row][col].nil?
        @grid.place_player_icon(row, col, player.icon)
        return
      else
        puts "Invalid position for play; please try again..."
      end
    end
  end
end