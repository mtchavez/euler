# encoding: utf-8
# Problem 17
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage

SYNTAX = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
}

def names_up_to(n)
  1.upto(n).map do |num|
    places = num.to_s.split('').map(&:to_i).reverse
    if num <= 19
      SYNTAX[num]
    else
      word = []
      word.push SYNTAX[places[3]] + ' thousand' if places.size == 4
      word.push SYNTAX[places[2]] + ' hundred' if places.size >= 3 && places[2] > 0
      if places[1] == 0 && places[0] <= 9
        word.push SYNTAX[places[0]]
      elsif places[1] == 1 && places[0] <= 9
        word.push SYNTAX[(places[1]*10)+ places[0]]
      else
        if places[1] > 0 && places[0] > 0
          word.push SYNTAX[places[1] * 10] + '-' + SYNTAX[places[0]]
        else
          word.push SYNTAX[places[1] * 10]
        end
      end
      word.compact.join(' and ')
    end
  end
end

class String

  def sanitize!
    gsub!('-', '')
    gsub!(/\s+/, '')
    self
  end
end

puts names_up_to(342).last.sanitize!.length
puts names_up_to(5).inject(0) { |sum, name| sum += name.sanitize!.length; sum }
puts names_up_to(1000).inject(0) { |sum, name| sum += name.sanitize!.length; sum }
