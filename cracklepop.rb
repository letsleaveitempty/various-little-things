# Write a program that prints out the numbers 1 to 100 (inclusive). 
# If the number is divisible by 3, print Crackle instead of the number. 
# If it's divisible by 5, print Pop. If it's divisible by both 3 and 5, print CracklePop.

def print_numbers
  (1..100).each do |number|
    case
    when number % 3 == 0 && number % 5 == 0
      print "CraclePop"
    when number % 5 == 0
      print "Pop"
    when number % 3 == 0 
      print "Crackle"
    else
      print number
    end
  end
end

print_numbers