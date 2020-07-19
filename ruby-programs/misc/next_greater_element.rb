class NextGreaterElement
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  def isEmpty?
    @stack.length.eql?(0)
  end

  def pop
    return if @stack.isEmpty?
    @stack.pop
  end

  def printNGE(arr)
    element = 0
    next_val = 0
    push(arr[0])
    (1..(arr.length)).each do |index|
      next_val = arr[index]
      if !isEmpty?
        element = pop
        while element.present? && element < next_val
          print "#{element} ---> #{next_val}"
          break if isEmpty?
          element = pop
        end
        push(element) if element > next_val
      end
      push(next_val)
    end
  end
end