# frozen_string_literal: true

require_relative 'decoding_board'
require_relative 'code'
# Mastermind game
class Mastermind
  def initialize
    @decoding_board = DecodingBoard.new
  end
end
