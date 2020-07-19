def maximum_sum_subarray(array)
  arr_len = array.length
  array_of_subarrays = []
  (0...arr_len).each do |index|
    base = array[index]
    ((index + 1)...arr_len).each do |sec_index|
      array_list << [base] + array[(index + 1)..sec_index]
    end
  end
  sum = 0
  maximum_subarray = []
  array_of_subarrays.each do |subarray|
    maximum_subarray = subarray if subarray.sum > sum
  end
  maximum_subarray
end
