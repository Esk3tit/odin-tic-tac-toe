require_relative 'grid'
require_relative 'player'

class Game
  def initialize
    @turn = 0
    @players = [Player.new('X'), Player.new('O')]
    @grid = Grid.new
  end

  def check_for_player_win(player)
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
end