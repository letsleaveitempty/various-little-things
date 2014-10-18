# Write a little code block in a language of your choice,
# which prints the numbers from 1 to 100 (inclusive).
# Though if the number is divisible by 5 instead of the number print "Ship".
# And if it's divisible by 3, print "Hacker".
# Print "HackerShip" if the number is divisible by both 3 and 5.

def print_numbers
  (1..100).each do |number|
    case
    when number % 3 == 0 && number % 5 == 0
      print "HackerShip"
    when number % 5 == 0
      print "Ship"
    when number % 3 == 0 
      print "Hacker"
    else
      print number
    end
  end
end

print_numbers