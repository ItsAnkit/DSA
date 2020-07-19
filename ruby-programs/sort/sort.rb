require 'pry'

def insertion_sort(array)
  arr_len = array.count
  index1 = 1
  while index1 < arr_len do
    index2 = index1 - 1
    key = array[index1]
    while index2 >= 0 && array[index2] > key
      array[index2 + 1] = array[index2]
      index2 -= 1
    end
    array[index2 + 1] = key
    index1 += 1
  end
  array
end

def bubblesort(array)
  arr_len = array.length
  (0...arr_len).each do |index1|
    (0...(arr_len - index1 - 1)).each do |index2|
      if array[index2] > array[index2 + 1]
        temp = array[index2]
        array[index2] = array[index2 + 1]
        array[index2 + 1] = temp
      end
    end
  end
  array
end

def selection_sort(array)
  arr_len = array.length
  (0...arr_len).each do |index1|
    min = index1
    ((index1 + 1)...arr_len).each do |index2|
      min = index2 if array[index2] < array[min]
    end
    temp = array[index1]
    array[index1] = array[min]
    array[min] = temp
  end
  array
end

# def mergesort(a, start, mid, end)
#   p = start
#   q = mid + 1
#   arr[end-start+1]
#   while(start <= end) do
#     if p > mid
#       arr[k++]= a[q++]
#     else if q > end
#       arr[k++] = a[p++]
#     else if a[p] < a[j]
#       arr[k++] = a[p++]
#     else
#       arr[k++] = a[q++]
#     end
#   end
#   for(p = 0; p<k; p++)
#     a[start++] = arr[p]
#   end
# end

array = [6, 2, 4, 8, 1, 5, 3]
#puts bubblesort(array)
# puts selection_sort(array)
puts insertion_sort(array)

