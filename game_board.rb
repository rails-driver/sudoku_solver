class GameBoard
  def self.new(*args)
    board = []
    while args.any? do
      board << args.slice!(0..8)
    end

    board
  end
end
