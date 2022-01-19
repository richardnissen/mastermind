require_relative 'peg'
class DecodingBoard
  attr_accessor :white_pegs, :black_pegs

  def initialize(white_pegs, black_pegs)
    @white_pegs = Array.new(white_pegs) { WhitePeg.new }
    @black_pegs = Array.new(black_pegs) { BlackPeg.new }
  end

  def to_s
    if @black_pegs.empty? && @white_pegs.empty?
      ''
    else
      "#{@white_pegs.join('-')} | #{@black_pegs.join('-')}"
    end
  end

  def insert_peg(peg)
    case true
    when peg.type == BlackPeg
      @black_pegs.push(peg)
    when peg.type == WhitePeg
      @white_pegs.push(peg)
    else
      false
    end
  end

  def correct_guess?
    number_of_black_pegs == 4
  end

  def remove_pegs()
    @white_pegs.clear
    @black_pegs.clear
  end

  def number_of_black_pegs
    @black_pegs.size
  end

  def number_of_white_pegs
    @white_pegs.size
  end

  def ==(other)
    number_of_white_pegs == other.number_of_white_pegs &&
      number_of_black_pegs == other.number_of_black_pegs
  end
end
