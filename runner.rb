require_relative 'mastermind'

play = true
while play
  game = Mastermind.new
  game.run
  puts 'Do you want to play again? y/n'
  until (answer = gets.chomp) == "y" || answer == "n"
    puts 'Please only enter y or n'
  end
  case answer
  when 'y'
    play = true
  when 'n'
    play = false 
  end
end