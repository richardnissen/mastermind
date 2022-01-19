module Helper
  def int_to_array(n)
    n.to_s.split('').map(&:to_i)
  end
end
