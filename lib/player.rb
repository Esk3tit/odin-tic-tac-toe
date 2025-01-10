class Player
  attr_reader :icon
  def initialize(icon)
    @icon = icon
  end

  def get_play_position
    # Loop and ask for user to enter row and col until they enter valid input
    # to place their icon on the game board
    begin
      puts "Enter position (row,col) - e.g. '2,3' for middle right: "
      row, col = gets.chomp.split(',').map { |num| num.to_i - 1 }  # subtract 1 to convert to 0-index internally
      raise "Invalid input" if row.nil? || col.nil?
      return row, col
    rescue
      puts "Invalid input format! Please use 'row,col' (numbers 1-3)"
      retry
    end
  end
end