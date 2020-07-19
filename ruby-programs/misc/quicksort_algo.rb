class QuicksortAlgo
  def call(arr, randomized)
    len = arr.length
    @randomized = randomized
    quicksort(arr, 0, len - 1)
    print arr
  end

  def quicksort(arr, low, high)
    if (low < high)
      if @randomized
        random_index = rand low..high
        swap(arr, random_index, high)
      end
      partition_value = partition(arr, low, high)
      quicksort(arr, low, partition_value - 1)
      quicksort(arr, partition_value + 1, high)
    end
  end

  def partition(arr, low, high)
    pivot = arr[high]
    i = low - 1
    j = low
    while j <= high - 1 do
      if (arr[j] < pivot)
        i += 1
        swap(arr, i, j)
      end
      j += 1
    end
    swap(arr, i + 1, high)
    return i + 1
  end

  def swap(arr, pos1, pos2)
    arr[pos1], arr[pos2] = arr[pos2], arr[pos1]
  end
end

arr = [9, 8, 1, 11, 3, 5, 0, 12, 4 ]
randomized = true
QuicksortAlgo.new.call(arr, randomized)