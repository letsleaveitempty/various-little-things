Shoes.app(title: 'Calculator', width: 240, height: 360) do

  result_row   = nil
  @number      = 0
  @prev_result = 0
  @operation   = nil

  def calculate(prev_result, operation, number)
    @number = prev_result + operation + number
    # para prev_result
    # para operation
    # para number
  end

  flow width: 240, height: 360 do
    flow height: 60 do
      background rgb(230, 230, 250)
      result_row = para @number, margin: 15, align: 'right'
    end

    flow height: 60 do
      background rgb(216, 191, 216)
      button "Clear", width: 180, height: 60 do
        @number = 0
        result_row.replace(@number)
      end
    end

    flow height: 240 do
      background rgb(188, 143, 143)
      buttons = %w(7 8 9 + 4 5 6 - 1 2 3 / 0 . = *)
      buttons.each do |btn|
        button btn, width: 50, height: 50 do
          case btn
            when /[0-9]/
              previous_digit = @number.to_i * 10
              new_digit      = btn.to_i
              @number        = previous_digit + new_digit
            when '='
              @number = @previous_result.send(@operation, @number)
            else
              # calculate(@previous_result, btn, @number)
              @previous_result, @number = @number, nil
              @operation = btn
          end
          result_row.replace(@number)  
        end
      end
    end
  end
end