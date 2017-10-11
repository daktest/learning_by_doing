#! /usr/bin/env ruby

def line1(num)
  phrase = case num
    when 1
      "#{num} bottle"
    when 0
      'No more bottles'
    else
      "#{num} bottles"
    end

  "#{phrase} of beer on the wall, #{phrase.downcase} of beer."
end

def line2(num)
  phrase1 = 'Take one down and pass it around, '
  case num
    when 2..Float::INFINITY
      phrase2 = "#{num} bottles of beer on the wall."
    when 1
      phrase2 = '1 bottle of beer on the wall.'
    when 0
      phrase2 = 'no more bottles of beer on the wall.'
    else
      phrase1 = 'Go to the store and buy some more, '
      phrase2 = '99 bottles of beer on the wall.'
  end

  "#{phrase1}#{phrase2}"

end

def sing(num)
  puts line1(num)
  puts line2(num - 1)
  puts ""
  sing(num - 1) if num > 0
end

sing(99)
