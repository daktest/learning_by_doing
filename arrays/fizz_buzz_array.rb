#! /usr/bin/env ruby

numbers = (1..100).to_a
result = []

numbers.each {|num|
  if num % 3 == 0 && num % 5 == 0
    result << 'FizzBuzz'
  elsif num % 3 == 0
    result << 'Fizz'
  elsif num % 5 == 0
    result << 'Buzz'
  else
    result << num
  end
}

puts result
