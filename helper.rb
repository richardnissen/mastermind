# frozen_string_literal: true

# A helper module for the Mastermind game
module Helper
  def int_to_array(number)
    number.to_s.split('').map(&:to_i)
  end
end
