def start_hangman
  puts "\n--- HANGMAN ---\n\n"
  quit_or_play
end

def dictionary
  %w(one two three four five)
end

def quit_or_play
  puts "Type any key to play, \"quit\" to... quit :)\n"
  print "> "
  @decision = gets.chomp.downcase.strip
  if @decision == 'quit'
    abort('See you next time!')
  else
    prepare_word
    play_game
  end
end

def prepare_word
  @word = dictionary.sample.upcase
  @word_letters = @word.chars.to_a
  @letters_to_guess = @word.chars.to_a
  @alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @lives = 7
end

def play_game
  print_word
  check_game
  get_letter
  check_letter_in_alphabet
end

def print_word
  puts "\n\nThis is your word:\n\n"
  @word_letters.each do |letter|
    if @alphabet.include?(letter) == true
      print "_ "
    else 
      print "#{letter} "
    end
  end 
end

def check_game
  if @lives == 0
    puts "\n\nYou LOSE!\n"
    puts "The word was: #{@word}\n\n"
    quit_or_play
  elsif @letters_to_guess == []
    puts "\n\nYou WIN!\n\n"
    quit_or_play
  else
    print_lives
    print_alphabet
  end
end

def get_letter
  puts "\n\nType your guess:\n"
  print "> "
  @given_letter = gets.chomp.upcase.strip
end

def print_lives
  puts "\n\nYou have #{@lives} lives left."
end

def print_alphabet
  puts "\nLetters to use:\n"
    @alphabet.each do |letter|
    print "#{letter} "
  end
end

def check_letter_in_alphabet
  if @alphabet.include?(@given_letter)
    @alphabet.delete(@given_letter)
    check_letters_to_guess
  else
    puts "\n\nSorry, you used the letter already. Pick a new one."
    get_letter
    check_letter_in_alphabet
  end
end

def check_letters_to_guess
  if @letters_to_guess.include?(@given_letter)
    @letters_to_guess.delete(@given_letter)
    play_game
  else
    @lives -= 1
    puts "\n\nNOPE!\n\n"
    play_game
  end 
end

start_hangman