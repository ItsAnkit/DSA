class Node
  attr_accessor :key, :next

  def initialize(key, next_node)
    @key = key
    @next = next_node
  end
end

class LinkedList
  def initialize(value)
    @head = Node.new(value, nil)
  end

  def insert(value)
    current = @head
    while !current.next.nil?
      current = current.next
    end
    current.next = Node.new(value, nil)
  end

  def delete(value)
    current = @head
    next_node = @head.next
    if @head.key.eql?(value)
      @head = next_node
    else
      while !next_node.key.eql?(value)
        current = next_node
        next_node = next_node.next
      end
      current.next = next_node.next
    end
  end

  def print_list
    current = @head
    while !current.nil?
      print "#{current.key} ---> "
      current = current.next
    end
  end

  # def return_list
  #   elements = []
  #   current_node = @head
  #   while current_node.next != nil
  #     elements << current_node
  #     current_node = current_node.next
  #   end
  #   elements << current_node
  # end
end

l = LinkedList.new(5)
l.insert(6)
l.insert(7)
l.insert(8)
l.insert(9)
l.insert(10)
print l.print_list
print "\n"
l.delete(5)
print l.print_list
