# frozen_string_literal: true

require_relative 'code'
require_relative 'decoding_board'
# The computer for a mastermind game
class Computer
  attr_accessor :list

  def initialize
    @list = list_setup
    @guess = 1122
    @first_guess = true
  end

  def reset
    @list = list_setup
    @guess = 1122
    @first_guess = true
  end

  def computer_guess(code)
    decoding_board = code.check_code(@guess)
    if decoding_board.correct_guess?
      @guess
    else
      @list.select! { |element| decoding_board == code.check_code(element) }
      false
    end
  end

  private

  def list_setup
    n = 0
    Array.new(1296) do
      n1 = n % 6 + 1
      n2 = (n / 6) % 6 + 1
      n3 = (n / 6 / 6) % 6 + 1
      n4 = n / 6 / 6 / 6 + 1
      n += 1
      [n4, n3, n2, n1].join('').to_i
    end
  end
end

computer = Computer.new
code = Code.new
code.new_code(1134)
computer.computer_guess(code)
puts computer.list
