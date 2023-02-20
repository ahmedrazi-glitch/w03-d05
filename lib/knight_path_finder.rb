require_relative 'tree_node.rb'
require 'set'

class KnightPathFinder
  attr_accessor :considered_positions 

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @size = 8*8
    @board = []
    @considered_positions = Set.new
  end

  def board_positions
    h = 8
    w = 8
    (0...h).each do |i|
      (0...w).each do |j|
        @board << [i,j]
      end
    end

    p @board
  end

  def build_move_tree()
    # return self if @value == search_value
    # q = [self]
    # until q.empty?
    #   check_node = q.shift
    #   return check_node if check_node.value == search_value
    #   q.concat(check_node.children)
    # end
    # nil

    q = [root_node]
    until q.empty?
      q.new_move_positions({})
  end

  def self.valid_moves(pos)
    row, col = pos
    moves = []
    motions = [-2, -1, 1, 2]
    motions.each do |i|
      motions.each do |j|
        moves << [row + i, col + j] if i.abs != j.abs 
      end
    end
    moves
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_positions = valid_moves.reject { |el| @considered_positions.include?(el) } 
    new_positions
  end

  
  
end

# pos = [0,0]
# k = KnightPathFinder.new(pos)
# p KnightPathFinder.valid_moves(pos)
# k.considered_positions << [2,1]
# p k.new_move_positions(pos)
# k.board_positions