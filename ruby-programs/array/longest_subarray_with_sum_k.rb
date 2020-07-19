require 'pry'

# prefix sum
def longest_subarray_with_sum_k(array, k)
  sum = 0
  max_len = 0
  hash = {}
  array.each do |element|
    sum += element
    index = array.index(element)
    max_len = index + 1 if sum == k
    hash[sum] = index unless hash.key?(sum)
    if hash.key?(sum - k) && max_len < (index - hash[sum - k])
      max_len = index - hash[sum - k]
    end
  end
  max_len
end

# for non-negative integers
def subarray_with_given_sum(array, sum)
  current_sum = array[0]
  start = 0
  arr_len = array.length
  (1...arr_len).each do |index|
    while current_sum > sum do
      current_sum -= array[start]
      start += 1
    end
    if current_sum < sum
      current_sum += array[index]
    end
    if current_sum == sum
      p array[start..index]
      return
    end
  end
end

# input = '-5, 8, -14, 2, 4, 12'
# k = -5
# p longest_subarray_with_sum_k(input.split(' ').map(&:to_i), k)

input = '9 5 2 8 1 9'
k = 15
subarray_with_given_sum(input.split(' ').map(&:to_i), k)
