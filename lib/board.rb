
class Board
  # Object variables
  attr_accessor :state, currplayer

  # Constructor
  def initialize(player)
    self.state = Array.new(3) {Array.new(3)}
    self.currplayer = player
  end

  # Make a move on the board
  def make_move(row, column)
    state[row][column] = currplayer
    currplayer == "X" ? currplayer = "O" : currplayer = "X"
  end

  # check board for wins
  def check_win()

    # Check Rows
    self.state.each do |row|
      winner = check_row(row)
      if winner
        return winner
      end
    end
    # Check Columns
    for i in 0...3
      column = [state[0][i], state[1][i], state[2][i]]
      winner = check_row(column)
      if winner
        return winner
      end
    end
    # Check Diags
    d1 = [state[0][0],state[1][1],state[2][2]]
    d2 = [state[2][0],state[1][1],state[0][2]]

    winner = check_row(d1)
    if winner
      return winner
    else
      winner = check_row(d2)
      if winner
        return winner
      end
    end
  end

  # To string
  def to_s
    outstring = ""

    self.state.each do |row|
      row.each do |element|
        ouststring += "|#{element}"
      end
      outstring += "\n"
    end
    puts(outstring)
  end


  private
  # Helper to check win, returns winner if any on a given size 3 row
  def check_row(inrow)

    count = {"X" => 0, "O" => 0}

    inrow.each do |element|
      if count.keys.include? element
        count[element] += 0
      end
    end
    if count["X"] == 3
      return "X"
    end
    if count["0"] == 3
      return "O"
    end
    return None
  end

end
