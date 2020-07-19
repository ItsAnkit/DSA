require 'pry'

def two_repeated_numbers(array)
  array.each do |element|
    index = array.index(element)
    sec_index = array[index].abs
    if array[sec_index] > 0
      array[sec_index] = - array[sec_index]
    else
      p element.abs if array[sec_index] < 0
    end
  end
end

input = [1, 1, 2, 3, 2]
two_repeated_numbers(input)

