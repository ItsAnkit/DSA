require 'pry'

class RandomizedQuicksort
  # def initialize(array)
  #   array = array
  # end

  def sort(array, start, last)
    if start < last
      partitioned_point = randomized_partition(array, start, last)
      sort(array, start, partitioned_point - 1)
      sort(array, partitioned_point + 1, last)
    end
    array
  end

  def randomized_partition(array, start, last)
    # for normal quicksort take last element as pivot
    pivot = (start..last).to_a.sample
    swap(array, pivot, last)
    partition(array, start, last)
  end

  def partition(array, start, last)
    pivot_value = array[last]
    first_counter = start - 1
    second_counter = start
    while second_counter < last do
      if array[second_counter] <= pivot_value
        first_counter += 1
        swap(array, first_counter, second_counter)
      end
      second_counter += 1
    end
    swap(array, first_counter + 1, last)
    return first_counter + 1
  end

  def swap(array, first_counter, second_counter)
    temp = array[first_counter]
    array[first_counter] = array[second_counter]
    array[second_counter] = temp
  end
end

array = [2, 6, 9, 7, 5, 6, 4, 1]
puts RandomizedQuicksort.new.sort(array, 0, array.length - 1)
