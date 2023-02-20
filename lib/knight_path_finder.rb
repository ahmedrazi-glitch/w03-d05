require_relative 'tree_node.rb'
require 'set'

class KnightPathFinder
  attr_accessor :considered_positions 

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @size = 8*8
    @considered_positions = Set.new
  end

  def build_move_tree()

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

