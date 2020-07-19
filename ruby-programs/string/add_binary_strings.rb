require 'pry'

def add_string(str1, str2)
  result = ''
  carry = 0
  str_array1 = str1.split('').map(&:to_i).reverse # 1 0 1 1
  str_array2 = str2.split('').map(&:to_i).reverse # 0 0 1 0
  str_array1.zip(str_array2).each do |first_ele, second_ele|
    sum_related_data = binary_sum(first_ele, second_ele)
    if carry == 1
      sum_related_data = binary_sum(sum_related_data[:value], carry)
    end
    carry = sum_related_data[:carry]
    result += sum_related_data[:value].to_s
  end
  result += '1' if carry.eql?(1)
  result.reverse
end

def binary_sum(first_ele, second_ele)
  data = {}
  if (first_ele.eql?(1) && second_ele.eql?(0)) || (first_ele.eql?(0) && second_ele.eql?(1))
    data[:value] = 1
    data[:carry] = 0
  elsif first_ele.eql?(1) && second_ele.eql?(1)
    data[:value] = 0
    data[:carry] = 1
  else
    data[:value] = 0
    data[:carry] = 0
  end
  data
end

puts 'Enter first string'
str1 = gets().chomp;
puts 'Enter second string'
str2 = gets().chomp;
puts add_string(str1, str2)
