# largest sum contiguous subarray

def kadane_algorithm(array)
  arr_len = array.length
  max_so_far = 0
  max_ending_here = 0
  (0...arr_len).each do |index|
    max_ending_here += array[index]
    max_so_far = max_ending_here if max_so_far < max_ending_here
    max_ending_here = 0 if max_ending_here < 0
  end
  return array.max if max_so_far == 0
  max_so_far
end

array = [-2, 13, -6, 11, -9]
puts kadane_algorithm(array)
