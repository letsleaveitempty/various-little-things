Shoes.app(title: "Hangman", width: 550, height: 350) do

  words    = %w(poland germany france norway spain)
  @letters = %w(A B C D E F G H I J K L M N O P Q R S T U W X Y Z)
  @word    = words.sample
  @letter  = ' '
  used_letters = nil

  def check_letter(letter)
    para letter
  end

  stack width: 0.5 do
    flow do
      used_letters = para @letter, margin: 70
    end

    para @word

    flow do
      @word.each_char do |letter|
        para '_'
      end
    end
  end

  flow width: 0.5 do
    image 'images/Hangman-0.png'
  end

  flow do
    @letters.each do |btn|
      button btn do
        @letter = btn.to_s
        used_letters.replace(@letter)
        check_letter(@letter)
      end
    end
  end
end