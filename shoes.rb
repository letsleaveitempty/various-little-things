Shoes.app do
 flow do
    stack :width => 50 do
      para "Hello!"
      para "Hello!"
      para "Hello!"
    end
    stack :width => 50 do
      para "Goodbye!"
      para "Goodbye!"
      para "Goodbye!"
    end
  end

  line = edit_line
  button "Push me!" do
    alert line.text
  end
end