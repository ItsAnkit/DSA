def wave_like_array(array)
  arr_len = array.length
  array.sort!
  (0...arr_len).step(2) do |index|
    next if (index + 1) == arr_len
    swap(array, index, index + 1)
  end
  array
end

def swap(array, first_element, second_element)
  temp = array[first_element]
  array[first_element] = array[second_element]
  array[second_element] = temp
end

array = [5, 7, 3, 2, 8, 1]
puts wave_like_array(array)
# result - [3, 2, 7, 5, 8]
