require 'pry'

def facing_the_sun(array)
  will_see_sun = [array[0]]
  (1...array.length).each do |index|
    will_see_sun << array[index] if array[0...index].select { |value| value > array[index] }.empty?
  end
  will_see_sun.length
end

puts 'Enter testcase count: '
testcases_count = gets().chomp.to_i
(1..testcases_count).each do |index|
  input = gets().chomp.split(' ')
  puts facing_the_sun(input)
end
