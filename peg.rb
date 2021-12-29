class Peg
  def type
    self.class
  end

  def to_s
    case true
    when is_a?(BlackPeg)
      'B'
    when is_a?(WhitePeg)
      'W'
    end
  end
end

class BlackPeg < Peg
end

class WhitePeg < Peg
end
