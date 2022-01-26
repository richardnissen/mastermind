# frozen_string_literal: true

require_relative 'helper'
require_relative 'decoding_board'
# A code for the mastermind game
class Code
  include Helper
  def initialize(code: false)
    @code = code
  end

  def new_code(code)
    if valid_code(code)
      @code = code
    else
      false
    end
  end

  def generate_code
    @code = Array.new(4) { rand(1..6) }.join.to_i
  end

  def valid_code(code)
    code.to_s.split('').all? { |n| n.to_i.between?(1, 6) }
  end


  def check_code(guess)
    guess_arr = int_to_array(guess)
    code_arr = int_to_array(@code)
    black_pegs = guess_arr.each_with_index.reduce(0) do |memo, (element, index)|
      element == code_arr[index] ? memo + 1 : memo
    end
    white_pegs = 4 - (code_arr - guess_arr).size - black_pegs
    DecodingBoard.new(white_pegs, black_pegs)
  end

  def to_i
    @code
  end

  def to_s
    @code.to_s
  end
end
