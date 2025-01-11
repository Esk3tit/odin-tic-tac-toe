class Grid
  attr_reader :cells
  def initialize
    @cells = Array.new(3) { Array.new(3) }
  end

  def place_player_icon(i, j, player_icon)
    @cells[i][j] = player_icon
  end

  def print_board
    puts "       Col"
    puts "        1   2   3"
    puts "       --- --- ---"
    @cells.each_with_index do |row, i| 
      print "Row #{i+1} | "
      puts "#{row.map { |cell| cell || ' ' }.join(' | ')} |"
      puts "       --- --- ---"
    end
    puts "\n"
  end
end