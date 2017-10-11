#! /usr/bin/env ruby

def get_word(word_type)
  puts "Give me #{word_type}:"
  gets.chomp
end

output = "Here is your madlib:\nA vacation is when you take a trip to some %s place with your %s family. \
Usually you go to some place that is near a/an %s or up on a/an %s. \
A good vacation place is one where you can ride %s or play %s or go hunting for %s. \
I like to spend my time %s or %s. \
When parents go on a vacation, they spend their time eating three %s a day, and fathers \
play golf, and mothers sit around %s. Last summer, my little brother fell in a/an %s \
and got poison %s all over his %s. My family is going to go to (the) %s, and I will \
practice %s. Parents need vacations more than kids because parents are always very %s \
and because they have to work %s hours every day all year making enough %s to pay \
for the vacation."

word_types = ['an adjective', 'another adjective', 'a noun', 'another noun',
              'a plural noun', 'a game', 'another plural noun', "a verb ending in 'ing'",
              "another verb ending in 'ing'", 'another plural noun', "another verb ending in 'ing'",
              'another noun', 'a plant', 'a part of the body', 'a place',
              "another verb ending in 'ing'", 'another adjective', 'a number',
              'another plural noun']

words = []

word_types.each {|type|
  words << get_word(type)
}

puts output % words
