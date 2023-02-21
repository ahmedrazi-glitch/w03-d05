class Board

  attr_writer :@grid

  def initialize(size=3)
    @grid = Array.new(size) { Array.new(size) }
  end
end