require 'pry'

def save_ironman(str)
  str = str.gsub(/[^a-zA-Z]/, '').downcase
  half = (str.length / 2).ceil
  (0...half).each do |index|
    return 'NO' unless str[index].eql?(str[str.length - index - 1])
  end
  'YES'
end

puts 'Enter testcase count: '
testcases_count = gets().chomp.to_i
(1..testcases_count).each do |index|
  puts "Enter String#{index}: "
  str = gets().chomp
  puts save_ironman(str)
end
