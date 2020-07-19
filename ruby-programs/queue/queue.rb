class Queue
  def initialize
    @array = []
  end

  def enqueue(element)
    @array << element
  end

  def dequeue
    @array.shift(1)
  end

  def is_empty?
    @array.empty?
  end

  def peek
    @array.first
  end

  def reverse
    @array.reverse
  end
end

# queue = Queue.new
# p queue.enqueue(5)
# p queue.enqueue(3)
# p queue.enqueue(1)
# p queue.dequeue
# p queue.peek
# p queue.is_empty?
# p queue
