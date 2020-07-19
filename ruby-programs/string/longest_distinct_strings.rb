require 'pry'

def longest_distinct_strings(str)
  str_len = str.length
  counter = 1
  array = [counter]
  max = []
  (0...str_len).each do |index|
    substr = []
    substr << str[index]
    ((index + 1)...str_len).each do |sec_index|
      if substr.include?(str[sec_index])
        break
      else
        substr << str[sec_index]
      end
    end
    max = substr if max.length < substr.length
  end
  max.length
end

puts 'Enter testcase count: '
testcases_count = gets().chomp.to_i
(1..testcases_count).each do |index|
  input = gets().chomp
  puts longest_distinct_strings(input)
end

def subsequence(str1, str2)
  (str1.split('') - str2.split('')).present? ? 0 : 1
end
