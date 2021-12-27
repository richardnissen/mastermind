require_relative 'peg.rb'
class DecodingBoard
  attr_accessor :white_pegs, :black_pegs
  def initialize
    @white_pegs = []
    @black_pegs = []
  end
  def to_s
    "#{@white_pegs} - #{@black_pegs}"
  end
  def insert_peg(peg)
    case peg.type
    when BlackPeg
      @black_pegs.push(peg)
    when WhitePeg
      @white_pegs.push(peg)
    else
      puts "This should never happen"
    end
  end
  def remove_pegs()
    @white_pegs.clear
    @black_pegs.clear
  end
end