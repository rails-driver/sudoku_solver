class Game
  def initialize
    @board = []
    @size = 0
  end

  def load_board(*args)
    @size = Math.sqrt(args.length).to_i
    @board = GameBoard.new(*args)
  end

  def solve(arr = @board)
    result = false
    coordinates = find_empty(arr)
    return arr unless coordinates

    row, col = coordinates

    (1..9).each do |num|
      next unless check_presence(arr, row, col, num)
      arr[row][col] = num
      return arr if solve(arr)
      arr[row][col] = 0
    end
    result
  end

  private

  def find_empty(arr)
    result = false
    9.times do |row|
      9.times { |col| result = [row, col] if arr[row][col].zero? }
    end

    result
  end

  def check_presence(arr, row, col, num)
    no_in_column_and_row = !check_row(arr, row, num) && !check_col(arr, col, num)
    no_in_column_and_row && !check_in_cube(arr, row - row % 3, col - col % 3, num)
  end

  def check_row(arr, row, num)
    result = false
    9.times { |col| result = true if arr[row][col] == num }

    result
  end

  def check_col(arr, col, num)
    result = false
    9.times { |row| result = true if arr[row][col] == num }

    result
  end

  def check_in_cube(arr, row, col, num)
    result = false
    3.times do |x|
      3.times { |y| result = true if arr[x + row][y + col] == num }
    end

    result
  end
end
