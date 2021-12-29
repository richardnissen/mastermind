module Helper
  def int_to_array(n)
    n.to_s.split('').map { |n| n.to_i}
  end
end