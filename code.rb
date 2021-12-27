class Code
  attr_reader :code
  def initialize
    @code = false
  end
  def new_code(code)
    if code.to_s.split("").all? {|n| n.to_i.between?(1, 6)}
      @code = code
    else
      false
    end
  end
  def generate_code()
    @code = Array.new(4) {rand(6) + 1}.join.to_i
  end
end