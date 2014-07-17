Shoes.app(title: "Hangman", width: 550, height: 350) do

  words     = %w(poland germany france norway spain)
  alphabet  = %w(A B C D E F G H I J K L M N O P Q R S T U W X Y Z)
  turn      = 0
  start_new = nil
  @word     = words.sample

  flow do
    @start = button "Start"
    @start.click do
      para words.sample
    end
  end


end