class Peg
  def type
    self.class
  end
  def to_s
    "#{self.type}"
end
class BlackPeg < Peg
end
class WhitePeg < Peg
end