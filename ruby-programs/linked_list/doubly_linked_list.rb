class Node
  attr_reader :data, :next_ptr, :prev_ptr

  def initialize(data, next_ptr = nil, prev_ptr = nil)
    @data = data
    @next_ptr = next_ptr
    @prev_ptr = prev_ptr
  end

  def set_next_pointer(next_ptr)
    @next_ptr = next_ptr
  end

  def set_prev_pointer(prev_ptr)
    @prev_ptr = prev_ptr
  end

  def get_next_pointer
    @next_ptr
  end

  def get_prev_pointer
    @prev_ptr
  end

  def next?
    !@next_ptr.nil?
  end

  def previous?
    !@prev_ptr.nil?
  end
end

class DoublyLinkedList
  def initialize(data)
    @head = Node.new(data)
  end

  def insert_node_at_beginning(data)
    current_head = @head
    unless current_head.nil?
      new_head = Node.new(data, current_head, nil)
      current_head.set_prev_pointer(new_head)
      @head = new_head
    else
      @head = Node.new(data)
    end
  end

  def insert_node_at_end(data)
    current_head = @head
    unless current_head.nil?
      while current_head.next?
        current_head = current_head.get_next_pointer
      end
      new_node = Node.new(data, nil, current_head)
      current_head.set_next_pointer(new_node)
    else
      @head = Node.new(data)
    end
  end

  def delete_node_at_beginning
    current_node = @head
    if current_node
      @head = current_node.get_next_pointer
      current_node = nil
    else
      p 'Empty list.'
    end
  end

  def delete_node_at_end
    current_node = @head
    prev_node = @head
    if @head
      while current_node.next?
        prev_node = current_node
        current_node = current_node.get_next_pointer
      end
      prev_node.set_next_pointer(nil)
      current_node = nil
    else
      p 'Empty list.'
    end
  end

  def display
    current_node = @head
    while current_node.next?
      p current_node.data
      current_node = current_node.get_next_pointer
    end
    p current_node.data
  end

  def rotate_by_p_nodes(p)
    if @head
      count = 1
      end_node = @head
      sublist_end_node = @head
      sublist_start_node = @head
      while end_node.next?
        sublist_end_node = sublist_end_node.get_next_pointer if count < p
        count += 1
      end
      @head = sublist_end_node.get_next_pointer
      sublist_end_node.set_next_pointer(nil)
      end_node.set_next_pointer(sublist_start_node)
      sublist_start_node
    else
      p 'Empty list.'
    end
  end
end

p 'insert at end'
dl = DoublyLinkedList.new(1)
(2..10).each { |x| dl.insert_node_at_end(x) }
dl.display
p 'insert at beginning'
dl.insert_node_at_beginning(11)
dl.display
p 'delete node at beginning'
dl.delete_node_at_beginning
dl.display
p 'delete node at end'
dl.delete_node_at_end
dl.display

