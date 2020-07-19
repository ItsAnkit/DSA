require 'pry'

def snake_pattern(array)
  length = array.length
  (0...length).each do |column|
    traversal = column.even? ? (0...length).to_a : (0...length).to_a.reverse
    index = 0
    # traversal array contains value to travserse from front to back or back to front
    while index < traversal.length do
      row = traversal[index]
      p array[column][row]
      index += 1
    end
  end
end

input = '45 48 54 21 89 87 70 78 15 '
array = input.split(' ').map(&:to_i)
matrix_size = Math.sqrt(array.length)
matrix = array.each_slice(matrix_size).to_a
snake_pattern(matrix)
