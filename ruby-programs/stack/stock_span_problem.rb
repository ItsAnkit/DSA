require 'pry'

def stock_span_problem(array)
  puts 1
  arr_len = array.length
  (1...arr_len).each do |base_index|
    element = array[base_index]
    stack = [element]
    (0..(base_index - 1)).to_a.reverse.each do |index|
      break if array[index] >= element
      stack << array[index] if array[index] < element
    end
    puts stack.length
  end
end

input = '100 80 60 70 60 75 85'
stock_span_problem(input.split(' ').map(&:to_i))
