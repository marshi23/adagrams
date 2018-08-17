require 'pry'
require 'csv'
require 'awesome_print'

# method to draw hand of letters
def draw_letters
  # { key = letter, value = quantity of letters}
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

  # create array with all available letters
  letter_bag = []
  letters_hash.map do |letter, amount|
    amount.times  { letter_bag << letter }
  end
  # random draw from available letters
  letter_hand = Array.new(letter_bag.sample(10))
  return letter_hand
end

# checks if word entered is valid
def uses_available_letters?(input, letters_in_hand)
flag = 0
# use dup to make a temporary copy of original hand
copy_letters_hand = letters_in_hand.dup
# split user word into array of single letters
# when word is valid remove letters used from copy hand
input.upcase.split('').each do |letter|
    if !(copy_letters_hand.include?(letter))
      flag += 1
    else
      copy_letters_hand.delete_at(copy_letters_hand.index letter)
    end
  end
  # return true if letters are all valid in hand, else -> false
  return flag > 0 ? false : true
end

# asign scores to letters
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
  # letter points based on value in hash
  score = 0
  word.upcase.split("").each { |letter| score +=  score_chart[letter] }
  # 7 to 10 letter words get 8 extra points
  score += 8 if word.length > 6 && word.length < 11
  return score
end


# make definition for tracking score
def highest_score_from(words)
  # create hash where all keys are valid words entered as key and the score
  # of that word is stored as the value
  word_score_hash = {}
  tied_words = []
  words.each_with_index { |word, i| word_score_hash[word] =  score_word(word) }
  # find max score within the hash and assign it to 'max'
  max = word_score_hash.max_by { |k,v| v }[1]
  # find potential ties by selecting all keys (words) in the hash that have
  # a value eqaul to 'max' --> store into an array
  word_score_hash.each { |k, v| tied_words << k if v == max }

  # finds and prints winner 10 letter words auto win, else shortest word wins
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
def is_in_english_dict?(input)
  # create hash of verified words
  dictionary_array = CSV.read('assets/dictionary-english.csv', headers: true)\
  .map { |word| word.to_h }
  # check if user entered word is in dictionary hash
  return dictionary_array.any? { |word| word['Word'] == input.downcase}
end
