def is_rotated?(str, rotated_str)
  # concat strings and find the rotated one in concated one
  concated_str = str.concat(str)
  concated_str.index(rotated_str).nil? ? 0 : 1
end

puts 'Enter testcase count: '
testcases_count = gets().chomp.to_i
(1..testcases_count).each do |index|
  puts "Enter String#{index}: "
  str = gets().chomp
  rotated_str = gets().chomp
  puts is_rotated?(str, rotated_str)
end
