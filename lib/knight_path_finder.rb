require_relative 'tree_node.rb'

class KnightPathFinder

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @size = 8*8
  end

  def build_move_tree()

  end

  def self.valid_moves(pos)
    row, col = pos

    move = [row+2, col+1]
    move_2 = [row+1,col+2]

  end
end