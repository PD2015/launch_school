
module PigLatin
  AY = 'ay'
  CHANGEABLE_VOWELS = /[uUyYxX]/

  def self.translate(string)
    words_ary = string.split(/\W/)
    words_ary.map! do |word|
      char_ary = word.chars
      loop do
        break if char_ary[0] =~ /[aeio]/
        if char_ary[0] =~ CHANGEABLE_VOWELS && char_ary[1] =~ /[^aeiou]/
          break
        elsif  char_ary[0] =~ CHANGEABLE_VOWELS && char_ary[1] =~ /[aeiou]/
          char_ary << char_ary.shift
          break
        else  
          char_ary << char_ary.shift
        end
      end
      char_ary << AY
      char_ary.join
    end
    words_ary.join(' ')
  end
end

p PigLatin.translate('apple')