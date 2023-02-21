require_relative 'tic_tac_toe'
require_relative 'board.rb'
require 'byebug'
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_mov_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  def deep_dup
    dup = []
  end
  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = []
    row = @board.length
    col = @board.first.length

    row.times do |i|
      col.times do |j|
        if @board[i][j].empty?
          new_board = @board.map(:dup)          new_board[i][j] = @next_mover_mark
          child = TicTacToeNode.new(new_board, next_mark, [i, j])
        end
      end
    end

  end
end