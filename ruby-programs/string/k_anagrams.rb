def k_anagram?(str1, str2, k)
  (str1.split('') - str2.split('')).uniq.length.eql?(k) ? 1 : 0
end

puts 'Enter testcase count: '
testcases_count = gets().chomp.to_i
(1..testcases_count).each do |index|
  input = gets().chomp.split(' ')
  k = gets().chomp.to_i
  puts k_anagram?(input[0], input[1], k)
end

def anagram_search(str1, str2)
  (str1.split('') - str2.split('')).length
end
