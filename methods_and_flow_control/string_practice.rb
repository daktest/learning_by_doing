#! /usr/bin/env ruby

my_string = 'this is a string to practice with'

puts my_string
puts my_string.capitalize
puts my_string.upcase
puts my_string.sub(/string/, "'string'").capitalize
puts "The string '#{my_string}' has #{my_string.length} characters"
puts my_string.reverse
puts ((my_string.split[5] + ' ') * 3).chop + '!'
