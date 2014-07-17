def initialize_hangman
  @alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @words = %w(one two three four five)

  puts "\n--- HANGMAN ---\n\n"

  quit_or_play
end

def quit_or_play
  puts "Type any key to play, \"quit\" to... quit :)\n"
  print "> "
  @decision = gets.chomp.downcase.strip
  if @decision == 'quit'
    abort('See you next time!')
  else
    play_game
  end
end

def play_game
  puts "\n\nThis is your word:\n\n"
  prepare_word
  guess_letter
end

def prepare_word
  word = @words.sample.upcase
  @word_letters = word.chars.to_a
  @letters_to_guess = word.chars.to_a
  @lives = 7
  print_word
end

def print_lives
  if @lives == 0
    puts "\nYou lost.\n\n"
    quit_or_play
  else
    puts "\n\nYou have #{@lives} lives left."
  end
end

def print_alphabet
  puts "\nLetters to use:\n"
  @alphabet.each do |letter|
    print "#{letter} "
  end
end

def guess_letter
  print_lives
  print_alphabet
  puts "\n\nType your guess:\n"
  print "> "
  @given_letter = gets.chomp.upcase.strip
  check_letter
end

def check_letter
  if @alphabet.include?(@given_letter)
    check_letters_to_guess
    @alphabet.delete(@given_letter)
  else
    puts "Sorry, you used the letter already."
  end
end

def check_letters_to_guess
  if @letters_to_guess.include?(@given_letter)
    print_word
  else
    @lives -= 1
    puts "\n\nNOPE!\n\n"
    guess_letter
  end
  print_lives
  print_alphabet
  @letters_to_guess.delete(@given_letter)
end

def print_word
  @word_letters.each do |letter|
    if @alphabet.include?(letter) == true
      print "_ "
    else 
      print "#{letter} "
    end
  end 
end

initialize_hangman