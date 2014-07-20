def start_hangman
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

def dictionary
  %w(Adult Aeroplane Air Aircraft Airforce Airport Album Alphabet Apple Arm Army Baby Baby Backpack Balloon Banana Bank Barbecue Bathroom Bathtub Bed Bed Bee Bible Bible Bird Bomb Book Boss Bottle Bowl Box Boy Brain Bridge Butterfly Button Cappuccino Car Carpet Carrot Cave Chair Chess Chief Child Chisel Chocolates Church Church Circle Circus Circus Clock Clown Coffee Comet Compact Compass Computer Crystal Cup Cycle Database Desk Diamond Dress Drill Drink Drum Dung Ears Earth Egg Electricity Elephant Eraser Explosive Eyes Family Fan Feather Festival Film Finger Fire Floodlight Flower Foot Fork Freeway Fruit Fungus Game Garden Gas Gate Gemstone Girl Gloves God Grapes Guitar Hammer Hat Hieroglyph Highway Horoscope Horse Hose Ice Insect Jet Junk Kaleidoscope Kitchen Knife Leather Leg Library Liquid Magnet Man Map Maze Meat Meteor Microscope Milk Milkshake Mist Money Monster Mosquito Mouth Nail Navy Necklace Needle Onion PaintBrush Pants Parachute Passport Pebble Pendulum Pepper Perfume Pillow Plane Planet Pocket Post Potato Printer Prison Pyramid Radar Rainbow Record Restaurant Rifle Ring Robot Rock Rocket Roof Room Rope Saddle Salt Sandpaper Sandwich Satellite School Ship Shoes Shop Shower Signature Skeleton Slave Snail Software Solid Space Spectrum Sphere Spice Spiral Spoon Sport Spot Square Staircase Star Stomach Sun Sunglasses Surveyor Swimming Pool Sword Table Tapestry Teeth Telescope Television Tennis Thermometer Tiger Toilet Tongue Torch Torpedo Train Treadmill Triangle Tunnel Typewriter Umbrella Vacuum Vampire Videotape Vulture Water Weapon Web Wheelchair Window Woman Worm)
end

start_hangman