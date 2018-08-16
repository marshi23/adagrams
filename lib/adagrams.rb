require 'pry'
require 'csv'
require 'awesome_print'
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
copy_letters_hand = letters_in_hand

  input.upcase.split('').each do |letter|
    if !(letters_in_hand.include?(letter))
      return false
    else
      # input.upcase.split('').each do |letter|
      #   copy_letters_hand.delete_at(copy_letters_hand.index letter)
      # end
    return true
    end
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

def highest_score_from(words)
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
winning_hash = {}
winning_word = tied_words.select { |word| word.length == 10 }
if tied_words.any? { |word| word.length == 10  }
  winning_hash[:word] = winning_word[0]
  winning_hash[:score] = max
else
    winner = tied_words.min_by  { |w| w.length }
    winning_hash[:word] = winner
    winning_hash[:score] = max 
end 

  return  winning_hash
end

# validates word in dictionary
# def is_in_english_dict?(input)
#   dictionary_array = CSV.read('assets/dictionary-english.csv').map do |word|
#         word
#     end
#    dictionary_array = dictionary_array.flatten
#    return dictionary_array.include?(input.downcase)
# end


def is_in_english_dict?(input)
  dictionary_array = CSV.read('assets/dictionary-english.csv', headers: true).map  do |word|
      word.to_h
  end
 return dictionary_array.any? { |word| word['Word'] == input}
end

# p is_in_english_dict?('jhfgkuftfuytdy')
# p is_in_english_dict?("kjsryfegjwfyegw")
# p highest_score_from(['aaaaaaaaaa', 'z', 'buck'])
