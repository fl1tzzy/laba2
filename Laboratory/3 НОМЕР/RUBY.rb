def reverse_number(number)
  reversed = 0
  last_digit = 0

  while number != 0
    last_digit = number % 10
    reversed = reversed * 10 + last_digit
    number /= 10
  end

  return reversed
end

size = gets.chomp.to_i

for i in 0..size-1
  number = gets.chomp.to_i
  puts reverse_number(number)
end