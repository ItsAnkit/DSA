require_relative 'queue.rb'
require_relative '../stack/stack.rb'
require 'pry'

# 1st way -  use a stack to reverse first k elements and then  a queue to store reset elements, afetr that first pop from stack and then dequeue from queue
#2nd way - dequeue k elements to stack and dequeue first (array_size - k) elements from top and enqueue stack.is_empty?them back

def reverse_k_queue_elements(array, k_value)
  # 2nd way...
  queue = Queue.new
  stack = Stack.new
  array.each do |element|
    queue.enqueue(element)
  end
  (0...k_value).each do |index|
    stack.push queue.dequeue
  end
  while !stack.is_empty? do
    queue.enqueue stack.top
    stack.pop
  end
  (0...(array.length - k_value)).each do |index|
    queue.enqueue queue.dequeue
  end
  queue
end

input = '1 2 3 4 5'
k_value = 3
puts reverse_k_queue_elements(input.split(' ').map(&:to_i), k_value)
