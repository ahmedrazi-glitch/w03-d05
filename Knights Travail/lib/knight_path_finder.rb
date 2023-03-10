require_relative 'tree_node.rb'
require 'set'

class KnightPathFinder
  attr_accessor :considered_positions, :root_node

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @size = 8*8
    @board = []
    board_positions
    @considered_positions = Set.new
    @considered_positions << start_pos
  end

  def board_positions
    h = 8
    w = 8
    (0...h).each do |i|
      (0...w).each do |j|
        @board << [i,j]
      end
    end

    #p @board
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

    q = [@root_node]
    until q.empty?
      processing_node = q.shift
      p "processing nodes = #{processing_node.value}"
      new_pos = new_move_positions(processing_node.value)
      p "new_positions are #{new_pos}"
      new_pos.each do |pos|
        new_node = PolyTreeNode.new(pos)
        new_node.parent = processing_node
        @considered_positions << pos
      end
      p "new_children are #{processing_node.children.count}"
      q += processing_node.children
    end
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
    new_board_positions = new_positions.select { |el| @board.include?(el) }
    new_board_positions
  end

  def find_path(pos)
    res = []
    processing_node = @root_node.bfs(pos)
    res.unshift(processing_node.value)

    until processing_node == @root_node
      # if processing_node != @root_node
      #   res.unshift(processing_node.value)
      # else
      #   res.unshift(@root_node.value)
      # end
      processing_node = processing_node.parent
      res.unshift(processing_node.value)
      # res.unshift(@root_node.value)
    end

    # until you reach the root
    #   1. given a starting point
    #   2. record parent
    #   3. move to the parent
    # res.unshift()
    res
  end
  
end

pos = [0,0]
k = KnightPathFinder.new(pos)
# p KnightPathFinder.valid_moves(pos)
# k.considered_positions << [2,1]
# p k.new_move_positions(pos)
# k.board_positions
k.build_move_tree
print k.root_node.bfs([6,4])
p k.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p k.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
#<PolyTreeNode:0x000000010c6a3dc8>%  
#<PolyTreeNode:0x0000000104c64580>%