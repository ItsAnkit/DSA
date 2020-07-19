class Stack
  def initialize
    @array = []
  end

  def push(element)
    @array << element
  end

  def pop
    @array.pop
  end

  def is_empty?
    @array.empty?
  end

  def top
    @array.last
  end
end

# stack = Stack.new
# p stack.push(5)
# p stack.push(3)
# p stack.push(1)
# p stack.pop
# p stack.top
# p stack.is_empty?
# p stack

