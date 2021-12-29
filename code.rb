require_relative 'helper'
require_relative 'decoding_board'
class Code
  include Helper
  attr_reader :code

  def initialize
    @code = false
  end

  def new_code(code)
    if code.to_s.split('').all? { |n| n.to_i.between?(1, 6) }
      @code = code
    else
      false
    end
  end

  def generate_code
    @code = Array.new(4) { rand(1..6) }.join.to_i
  end

  def check_code(guess)
    guess_arr = int_to_array(guess)
    code_arr = int_to_array(@code)
    black_pegs = guess_arr.each_with_index.reduce(0) do |memo, (element, index)|
      element == code_arr[index] ? memo + 1 : memo
    end
    white_pegs = guess_arr.intersection(code_arr).size - black_pegs
    DecodingBoard.new(white_pegs, black_pegs)
  end
end
