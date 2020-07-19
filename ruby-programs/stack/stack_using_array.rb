require 'pry'

def stack_using_array(array)
  arr_len = array.length
  stack = []
  popped = []
  index = 0
  while index < arr_len do
    if array[index].eql?(1)
      stack << array[index + 1]
      index += 2
    elsif array[index].eql?(2)
      popped << stack.pop
      index += 1
    end
  end
  popped
end

input = '1 2 1 3 2 1 4 2'
puts stack_using_array(input.split(' ').map(&:to_i))
