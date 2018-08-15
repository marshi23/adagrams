require 'pry'
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
# letters_in_hand = draw_letters
# puts letters_in_hand

# collects word from user
# print "Enter word: "
# word = gets.chomp.upcase

# checks if word entered is valid
def uses_available_letters?(input, letters_in_hand)
flag = 0

  input.upcase.split('').each do |letter|
      if !(letters_in_hand.include?(letter))
        flag += 1
      else
        letters_in_hand.delete_at(letters_in_hand.index letter)
      end
  end

  if flag > 0
    return false
  else
    return true
  end

end

# score_chart = {
#   "A" => 1,
#   "B" => 3,
#   "C" => 3,
#   "D" => 2,
#   "E" => 1,
#   "F" => 4,
#   "G" => 2,
#   "H" => 4,
#   "I" => 1,
#   "J" => 8,
#   "K" => 5,
#   "L" => 1,
#   "M" => 3,
#   "N" => 1,
#   "O" => 1,
#   "P" => 3,
#   "Q" => 10,
#   "R" => 1,
#   "S" => 1,
#   "T" => 1,
#   "U" => 1,
#   "V" => 4,
#   "W" => 4,
#   "X" => 8,
#   "Y" => 4,
#   "Z" => 10
# }

def score_word(word)
  score_chart = {
    "A" => 1,
    "B" => 3,
    "C" => 3,
    "D" => 2,
    "E" => 1,
    "F" => 4,
    "G" => 2,
    "H" => 4,
    "I" => 1,
    "J" => 8,
    "K" => 5,
    "L" => 1,
    "M" => 3,
    "N" => 1,
    "O" => 1,
    "P" => 3,
    "Q" => 10,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "U" => 1,
    "V" => 4,
    "W" => 4,
    "X" => 8,
    "Y" => 4,
    "Z" => 10
  }

score = 0
  word.upcase.split("").each do |letter|
    score +=  score_chart[letter]
  end

  if word.length > 6 && word.length < 11
    score += 8
  end
 return score
end


# make definition for tracking score

def highest_score_from_words(words) 
  word_score_hash = {}
  tied_words = []
  words.each_with_index do |word, i|
     word_score_hash[word] =  score_word(word)
  end

  # puts "#{word_score_hash} = word score hash"

  max = word_score_hash.max_by { |k,v| v  }

  # puts "#{max} = array with max score"
  # puts "The max score is #{max[1]}"

  max = max[1]
  word_score_hash.each do |k, v|
   if v == max
    tied_words << k
   end
  end
  # puts "The ties are #{tied_words}"

winner = ""
 tied_words.each do |word|
    if word.length == 10 
      winner = word 
      return winner
    end
   
  end 
  winning_hash = {}
  winner = tied_words.min_by  { |w| w.length } 
  # p winner 
  winning_hash[:word] = winner 
  winning_hash[:score] = max 

  return  winning_hash
end


p highest_score_from_words(['stormyyy', 'help', 'buck'])

# puts uses_available_letters?(word, letters_in_hand)
