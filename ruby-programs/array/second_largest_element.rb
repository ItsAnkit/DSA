def second_largest_element(array)
  if array[0] < array[1]
    min = array[0]
    second_min = array[1]
  else
    min = array[1]
    second_min = array[0]
  end
  (2...array.length).each do |index|
    if array[index] < min
      second_min = min
      min = array[index]
    end
  end
  second_min
end
