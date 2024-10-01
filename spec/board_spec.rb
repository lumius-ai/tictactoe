# Require file in tictactoe/lib/board.rb
require './lib/board'

describe Board

  describe "Constructor" do
    it "successfully creates an object with player x" do
      b = Board.new("X")
      expect(b.currplayer).to eql("X")
    end

    it "successfuly creates object with blank board" do
      expect(b.state).to eql([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end
  end