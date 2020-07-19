require_relative 'stack.rb'
require 'pry'

def next_smaller_element(array)
  stack = Stack.new
  stack.push(array[0])
  arr_len = array.length
  (1...arr_len).each do |index|
    next_element = array[index]
    unless stack.is_empty?
      element = stack.pop
      while element > next_element do
        p "#{element} --> #{next_element}"
        break if stack.is_empty?
        element = stack.pop
      end
      stack.push(element) if element < next_element
    end
    stack.push(next_element)
  end
  while !stack.is_empty? do
    p "#{stack.pop} --> nil"
  end
end

input = '4 2 9 5 3'
next_smaller_element(input.split(' ').map(&:to_i))
