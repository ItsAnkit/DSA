require 'pry'

def smallest_str_window(original_str, required_str)
  original_str_array = original_str.split('')
  required_window = required_str.split('')
  index = 0
  min_window = original_str_array
  return -1 unless (required_window - original_str_array).empty?
  while index < original_str_array.length do
    window = original_str_array.drop(index)
    counter = 0
    while counter < window.length do
      final_window = window[0, counter+1]
      if (required_window - final_window).empty?
        min_window = final_window if final_window.length < min_window.length
      end
      counter += 1
    end
    index += 1
  end
  min_window.join('')
end

puts 'Enter string: '
str = gets().chomp
dataset = str.split(' ')
puts smallest_str_window(dataset[0], dataset[1])
