# go two level deep and look for last element in rest of array by computing total_sum - sum of first two elements
def triplet_combination(array, total_sum)
  arr_len = array.length
  (0...arr_len).each do |index|
    ((index + 1)...arr_len).each do |sec_index|
      sum_of_two = array[index] + array[sec_index]
      next if sum_of_two > total_sum
      return 1 if array[(sec_index + 1)...(arr_len)].include?(total_sum - sum_of_two)
    end
  end
  0
end

puts 'Enter testcase count: '
testcases_count = gets().chomp.to_i
(1..testcases_count).each do |index|
  input = gets().chomp.split(' ').map(&:to_i)
  sum = gets().chomp.to_i
  puts triplet_combination(input, sum)
end
