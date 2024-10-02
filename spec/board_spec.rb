require_relative '../lib/board'

describe Board do
  
  # Constructor should init a blank slate with the specified current player
  describe "Constructor testing" do
    b = Board.new("X")
    blank_board = [[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]]
    it "Inits the correct player" do
      expect(b.current_player).to eql("X")
    end

    it "Inits with a blank board state" do
      expect(b.state).to eql(blank_board)
    end
  end

  # A move on the board should update the board, and swap players for next move. Making an illegal move returns false, true otherwise
  describe "Move testing" do
    b = Board.new("X")
    correct_move_X = [[nil,nil,nil], [nil,"X",nil], [nil,nil,nil]]
    correct_move_O = [["O",nil,nil], [nil,"X",nil], [nil,nil,nil]]
    it "Correctly registers an X move" do
      b.make_move(1,1)
      expect(b.state).to eql(correct_move_X)
    end
    
    it "Correctly registers player switch" do
      b.make_move(0,0)
      expect(b.state).to eql(correct_move_O)
    end

    it "Prevents moving on an already filled block" do
      expect(b.make_move(0,0)).to eql(false)
    end

    it "Prevents moving out of bounds" do
      expect(b.make_move(-1, 4)).to eql(false)
    end
  end

  # A game can be won horizontally, vertically, diagonally, returning the winner, Nil if no winner
  describe "Win_detection testing" do
    b = Board.new("X")
    horizontal_win = [["X","X",nil], ["O","O","O"], [nil,"X",nil]]
    vertical_win = [["O","X",nil], ["O","X",nil], [nil,"X",nil]]
    diagonal_win = [["O","X","X"], [nil,"O","X"], [nil,nil,"O"]]
    no_winner = [[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]]

    it "Correctly registers a horizontal win" do
      b.state = horizontal_win
      expect(b.check_win()).to eql("O")

    end
    it "Correctly registers a vertical win" do
      b.state = vertical_win
      expect(b.check_win()).to eql("X")

    end
    it "Correctly registers a diagonal win" do
      b.state = diagonal_win
      expect(b.check_win()).to eql("O")
    end
    it "Correctly registers NO winners" do
      b.state = no_winner
      expect(b.check_win()).to eql(nil)
    end
  end
end
