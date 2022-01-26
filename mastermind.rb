# frozen_string_literal: true

require_relative 'decoding_board'
require_relative 'code'
require_relative 'computer'

# Mastermind game
class Mastermind
  def initialize
    @decoding_board = DecodingBoard.new(0, 0)
    @code = Code.new
    puts 'Welcome to the Mastermind game!'
    puts 'Please select gametype (1 for human codebreaker, 2 for computer codebreaker)'
    until (@type = gets.chomp.to_i).between?(1, 2)
      puts 'Please select gametype (1 for human codebreaker, 2 for computer codebreaker)'
    end
  end

  def run
    @type == 1 ? human_codebreaker : computer_codebreaker
  end

  def human_codebreaker
    @code.generate_code
    number_of_guesses = 1

    until @decoding_board.correct_guess?
      puts "Guess number: #{number_of_guesses}"
      puts 'Please enter a guess with four numbers between 1 - 6 (e.g.  3254)'
      until @code.valid_code(guess = gets.chomp.to_i)
        puts 'Please enter a guess with four numbers between 1 - 6 (e.g.  3254)'
      end
      number_of_guesses += 1
      puts @decoding_board = @code.check_code(guess)
    end
    puts "You guessed correct! with #{number_of_guesses - 1} guesses"
  end

  def computer_codebreaker
    computer = Computer.new
    number_of_guesses = 1
    puts 'Please enter a code with four numbers between 1 - 6 (e.g.  3254)'
    until @code.new_code(gets.chomp.to_i)
      puts 'Please enter a code with four numbers between 1 - 6 (e.g.  3254)'
    end
    puts 'Computer now attempting to break your code'
    until @decoding_board.correct_guess?
      puts "Computer guess number: #{number_of_guesses}"
      sleep(1)
      puts "Computer guesses #{computer.guess}"
      puts @decoding_board = @code.check_code(computer.guess)
      computer.computer_guess(@code)
      number_of_guesses += 1
    end
    puts "The computer guessed your code which is #{computer.guess}, it did it in #{number_of_guesses - 1} guesses"
  end
end
