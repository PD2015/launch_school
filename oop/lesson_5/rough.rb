unmarked_keys = [1, 2, 3, 4, 5, 6, 7, 8, 9]
separator = ','
final_separator = 'or'



# temp = unmarked_keys.map do |num|
#   unless num == unmarked_keys.last || num == unmarked_keys[-2]
#   num.to_s + separator
#   end
# end

# temp.pop(2)
# temp << unmarked_keys[-2]
# temp.insert(-1, final_separator)
# temp << unmarked_keys.last


# p temp.join(' ')

 def joiner(unmarked_keys, separator = ',', final_separator= 'or')
    unless unmarked_keys.size < 1
      joiner_unmarked_keys = unmarked_keys.map do |num|
        unless num == unmarked_keys[-2, 2]
        num.to_s + separator
        end
      end
    end
    joiner_unmarked_keys.pop(1)
    joiner_unmarked_keys[-1]= "#{unmarked_keys[-2]} #{final_separator} #{unmarked_keys.last}"
    return joiner_unmarked_keys.join(' ')
  end

  p joiner(unmarked_keys)