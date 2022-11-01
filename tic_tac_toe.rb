class Board
  
  @@board = Array.new(3, 0) {Array.new(3, 0)}
  
  def initialize()

  end

  def win?() # check if the board contains winning pattern
    result = false
    @@board.each do |row| # check rows
      result = (row.uniq.count == 1)
      result ? break : false
    end

    if (@@board[0][0] == @@board[1][0]) && (@@board[1][0] == @@board[2][0]) #check columns
      return true
    elsif (@@board[0][1] == @@board[1][1]) && (@@board[1][1] == @@board[2][1])
      return true
    elsif (@@board[0][2] == @@board[1][2]) && (@@board[1][2] == @@board[2][2])
      return true
    end
    
    if (@@board[0][0] == @@board[1][1]) && (@@board[1][1] == @@board[2][2]) #check diagonals
      return true
    elsif (@@board[0][2] == @@board[1][1]) && (@@board[1][1] == @@board[2][0])
      return true
    end
    result
  end

  def create() # 3x3 board numbered from 1-9
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

  def board_input(x_o, location)
    location = location.to_i
    coords = convert_to_coord(location)
    case x_o
    when 'x'
      if @@board[coords[0]][coords[1]] != location
        puts "Invalid choice"
      else
        @@board[coords[0]][coords[1]] = 'x'
      end
    when 'o'
      if @@board[coords[0]][coords[1]] != location
        puts "Invalid choice"
      else
        @@board[coords[0]][coords[1]] = 'o'
      end
    else 
      puts "Invalid input"
    end
  end

  private
  def convert_to_coord(location) # converts numbers(1- 9) to position on board array
    a, b = 0, 0
    @@board.each do |row|
      if row.include?(location)
        a = @@board.index(row)
        b = row.index(location)
        break
      end
    end
    return [a, b]
  end

  
end

temp = Board.new()
temp.create
temp.board_input('o', 4)
temp.board_input('o', 5)
temp.board_input('o', 6)
temp.display_board
puts temp.win?


