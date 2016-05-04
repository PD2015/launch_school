
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