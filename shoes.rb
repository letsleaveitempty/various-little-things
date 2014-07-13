Shoes.app do
  start_game
  enter_letter
  check_letter
end

def start_game
  flow margin: 12 do
    @words = %w(poland germany norway spain france)
    @words.sample.chars.each do |letter|
      para "_"
    end
  end
end

def enter_letter
  flow margin: 12 do
    @letter = edit_line
    @letter.focus
    @check_button = button 'Check it!'
    @check_button.click { check_letter }
  end
end

def check_letter
  para @letter.text unless @letter.text.empty?
  @letter.text = ''
end
