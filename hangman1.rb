def initialize_game
  display_welcome_text
  set_variables
  get_letter
  start_game if @user_word == 'start'
end
 
def display_welcome_text
  puts "\n<<< Terminal Hangman >>>\n\n"
  puts "Type \"start\" to begin a new game\n"
end

def set_variables
  @turn = 0
  @rematch = nil
  @alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @lives = 7
  @words = %w(one two three four five)
end

def get_letter
  print "> "
  @user_word = gets.chomp.downcase.strip
end

def start_game
  puts "Generating your word...\n\n"
   
  # Loop the game until the user types 'quit'
  until @rematch == "quit"
   
    word = @words.sample.upcase
    word_letters = word.chars.to_a
    @remaining_letters = word.chars.to_a
    
    # If it is the first turn OR they choose to rematch
    if @rematch == "new" || @turn == 0
      word_letters.each do |letter|
        print "_ "
      end

      display_lives
      display_alphabet
      guess
   
      # After the first guess, only break if lives are 0 or no letters remaining
      until @lives == 0 || @remaining_letters == []
        if word_letters.include?(@given_letter) == true
          puts "\n\n"
          @alphabet.delete(@given_letter)  
          @remaining_letters.delete(@given_letter)

          if @remaining_letters == []
            break
          end

          word_letters.each do |letter|
            if @alphabet.include?(letter) == true
              print "_ "
            else 
              print "#{letter} "
            end
          end
      
          display_lives
          display_alphabet
          guess
    
        elsif @lives > 1
          @lives -= 1
          puts "WRONG!\n\n"
          @alphabet.delete(@given_letter)
    
          word_letters.each do |letter|
            if @alphabet.include?(letter) == true
              print "_ "
            else 
              print "#{letter} "
            end
          end

          display_lives
          display_alphabet
          guess

        else 
          @lives -= 1
          puts "YOU LOSE!\n"
          puts "The word was #{word}"
        end  
      end

      if @remaining_letters == []
        puts "CONGRATULATIONS! You got the word #{word}" 
        @turn += 1
        puts "Type \"new\" to play again, type \"quit\" to exit"
        print "> "
        @rematch = gets.chomp.downcase.strip
      else
        puts "Please type either \"new\" OR \"quit\""
      end
    end
  end
end

def guess
  puts "Guess a letter: "
  print "> "
  @given_letter = gets.chomp.upcase.strip
  until @alphabet.include?(@given_letter) == true
     puts "Please guess from the available letters"
     print "> "
     @given_letter = gets.chomp.upcase.strip
  end
end

def display_alphabet
  @alphabet.each do |alph_letter|
    print "#{alph_letter} "
  end
end

def display_lives
  puts "Lives Remaining: #{@lives}"
  puts "Letters Remaining: "  
  puts @remaining_letters
end

initialize_game