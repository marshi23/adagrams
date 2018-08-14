# letters_hash = {
# "A" => 9,
# "B" => 2,
# "C" => 2,
# "D" => 4,
# "E" => 12,
# "F" => 2,
# "G" => 3,
# "H" => 2,
# "I" => 9,
# "J" => 1,
# "K" => 1,
# "L" => 4,
# "M" => 2,
# "N" => 6,
# "O" => 8,
# "P" => 2,
# "Q" => 1,
# "R" => 6,
# "S" => 4,
# "T" => 6,
# "U" => 4,
# "V" => 2,
# "W" => 2,
# "X" => 1,
# "Y" => 2,
# "Z" => 1
# }


def draw_letters
  letters_hash = {
  "A" => 9,
  "B" => 2,
  "C" => 2,
  "D" => 4,
  "E" => 12,
  "F" => 2,
  "G" => 3,
  "H" => 2,
  "I" => 9,
  "J" => 1,
  "K" => 1,
  "L" => 4,
  "M" => 2,
  "N" => 6,
  "O" => 8,
  "P" => 2,
  "Q" => 1,
  "R" => 6,
  "S" => 4,
  "T" => 6,
  "U" => 4,
  "V" => 2,
  "W" => 2,
  "X" => 1,
  "Y" => 2,
  "Z" => 1
  }

# creats array of 10 random letters
  letter_bag = []
  letters_hash.map do |letter, amount|
    amount.times  { letter_bag << letter }
  end

  letter_hand = Array.new(letter_bag.sample(10))

  return letter_hand
end
# displays letter hand
letters_in_hand = draw_letters
puts letters_in_hand

# collects word from user
print "Enter word: "
word = gets.chomp.upcase

# checks if word entered is valid
def uses_available_letters?(input, letters_in_hand)
flag = 0

  input.split('').each do |letter|
      if !(letters_in_hand.include?(letter))
        flag += 1
      end
  end

  if flag > 0
    return false
  else
    return true
  end

end

# puts uses_available_letters?(word, letters_in_hand)
