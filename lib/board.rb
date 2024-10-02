
class Board
  # Object variables
  attr_accessor :state, :current_player

  # Constructor
  def initialize(player)
    self.state = Array.new(3) {Array.new(3)}
    self.current_player = player
  end

  # Make a move on the board
  def make_move(row, column)
    row = row.to_i
    column = column.to_i
    # Check that the values are in bounds
    if(row < 0 or row > 2)
      return false
    end
    if(column < 0 or column > 2)
      return false
    end
    # Check that the square is unoccupied
    if(self.state[row][column] != nil)
      return false
    end
    self.state[row][column] = self.current_player
    self.current_player == "X" ? self.current_player = "O" : self.current_player = "X"
  end

  # Check for win condition, return winner, nil otherwise
  def check_win
    winner = nil
    # Check for horizontal win
    self.state.each do |row|
      winner = check_row(row)

      if winner != nil
        return winner
      end
    end
    # Check for vertical win
    for i in 0...3
      r = [self.state[0][i], self.state[1][i], self.state[2][i]]
      winner = check_row(r)
      if winner != nil
        return winner
      end
    end

    # Check diagonal win
    d1 = [self.state[0][0],self.state[1][1],self.state[2][2]]
    d2 = [self.state[2][0],self.state[1][1],self.state[0][2]]
    winner = check_row(d1)
    if winner != nil
      return winner
    end
    winner = check_row(d2)
    if winner != nil
      return winner
    end

    # Check tie
    self.state.each do |row|
      row.each do |element|
        if element == nil
          return nil
        end
      end
    end
    winner = "T"

    return winner
    
  end

  # To string
  def to_s
    outstr = 
   "       0  1  2 |\n
    0 | #{self.state[0][0]} | #{self.state[0][1]} | #{self.state[0][2]} |\n
    1 | #{self.state[1][0]} | #{self.state[1][1]} | #{self.state[1][2]} |\n
    2 | #{self.state[2][0]} | #{self.state[2][1]} | #{self.state[2][2]} |\n
    
    Current Player: #{self.current_player}"

    return outstr
  end

  private
  #Private helper to check_win
  def check_row(inrow)
    counts = {"X" => 0, "O" => 0}

    inrow.each do |element|
      if(counts.keys.include? element)
        counts[element] += 1
      end
    end
    if counts["X"] == 3 
      return "X"

    end
    if counts["O"] == 3
      return "O"
    end
    return nil
  end
 

end
