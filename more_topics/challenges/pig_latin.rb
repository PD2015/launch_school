
module PigLatin
  AY = 'ay'
  CHANGEABLE_VOWELS = /[uUyYxX]/
  CONSONANT = /[^aeiou]/
  VOWEL = /[aeiou]/

  def self.translate(string)
    string.split(/\W/)
          .map! { |word| char_processing(word.chars) }
          .join(' ')
  end

  def self.char_processing(char_ary)
    loop do
        break if char_ary[0] =~ /[aeio]/
        if char_ary[0] =~ CHANGEABLE_VOWELS && char_ary[1] =~ CONSONANT
          break
        elsif  char_ary[0] =~ CHANGEABLE_VOWELS && char_ary[1] =~ VOWEL
          char_ary << char_ary.shift
          break
        else  
          char_ary << char_ary.shift
        end
      end
    char_ary << AY
    char_ary.join
  end
end

p PigLatin.translate('apple')


# Given solution:

# class PigLatin
#   def self.translate(phrase)
#     phrase.split(' ').map do |word|
#       translate_word(word)
#     end.join(' ')
#   end

#   def self.translate_word(word)
#     if begins_with_vowel_sound?(word)
#       word + 'ay'
#     else
#       consonant_sound, the_rest_of_word = parse_for_consonant(word)
#       # here multiple variable assignment is happening from the return value of parse_for_consonant method.
        # return value shouldnt require [] as shown here.
#       the_rest_of_word + consonant_sound + 'ay'
#     end
#   end

#   def self.begins_with_vowel_sound?(word)
#     word.match(/\A[aeiou]|[xy][^aeiou]/)
#   end

#   def self.parse_for_consonant(word)
#     consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
#     [consonant_split[1], consonant_split[2]]
#   end
# end
