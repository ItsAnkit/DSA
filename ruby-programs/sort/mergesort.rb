require 'pry'

class Mergersort
  def sort(array, start, last)
    if start < last
      mid = (start + last) / 2
      sort(array, start, mid)
      sort(array, mid + 1, last)
      array = merge(array, start, mid, last)
    end
  end

  def merge(array,start, mid, last)
    sorted_array = []
    p = start
    q = mid + 1
    k = 0
    (start..last).each do |index|
      if p > mid
        sorted_array[k] = array[q]
        k += 1
        q += 1
      elsif q > last
        sorted_array[k] = array[p]
        k += 1
        p += 1
      elsif array[p] < array[q]
        sorted_array[k] = array[p]
        k += 1
        p += 1
      else
        sorted_array[k] = array[q]
        k += 1
        q += 1
      end
    end
    (0...k).each do |index|
      array[start] = sorted_array[index]
      start += 1
    end
    array
  end
end

array = [3, 5, 1, 4, 9, 2]
puts Mergersort.new.sort(array, 0, array.length - 1)
