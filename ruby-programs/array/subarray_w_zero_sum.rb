require 'active_support'
require 'active_support/core_ext'
require 'pry'

def subarray_w_zero_sum(array)
  arr_len = array.length
  prefix_sum_list = Hash.new { |key, value| key[value] = Array.new }
  prefix_sum = 0
  array.each do |element|
    prefix_sum += element
    index = array.index(element)
    prefix_sum_list[prefix_sum] << index
  end
  # prefix sum array with duplicate values or 0 value will make sub array with sum as 0.
  index_list = []
  index_list << [prefix_sum_list.values.select { |value| value.eql?(0) }[0]]
  prefix_sum_list.select { |key, value| value.count > 1 }.each_value do |values|
    index_list << ((values[0] + 1)..values[1]).to_a
  end
  p index_list
end

# O(n2) complexity
# def subarray_w_zero_sum(array)
#   arr_len = array.length
#   subarray_list = []
#   (0...arr_len).each do |index|
#     base = [array[index]]
#     ((index + 1)...arr_len).each do |sec_index|
#       subarray_list << base
#       base = base + [array[sec_index]]
#     end
#     subarray_list << base
#   end
#   subarray_list.each do |subarray|
#     p subarray if subarray.sum.eql?(0)
#   end
# end

input = '4 2 -3 1 6'
subarray_w_zero_sum(input.split(' ').map(&:to_i))
