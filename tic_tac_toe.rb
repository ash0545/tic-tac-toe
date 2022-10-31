class Board
  
  @@board = Array.new(3, 0) {Array.new(3, 0)}
  
  def initialize()

  end

  def win?()

  end

  def create()
    i = 1
    @@board.map! do |row|
      row.map! do |element|
        element = i
        i += 1
        element
      end
    end
  end

  def display_board()
    puts "#{@@board[0][0]} | #{@@board[0][1]} | #{@@board[0][2]}"
    puts "--  --  --"
    puts "#{@@board[1][0]} | #{@@board[1][1]} | #{@@board[1][2]}"
    puts "--  --  --"
    puts "#{@@board[2][0]} | #{@@board[2][1]} | #{@@board[2][2]}"
  end
end

temp = Board.new()
temp.create
temp.display_board

