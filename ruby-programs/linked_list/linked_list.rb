require 'pry'

class Node
    attr_reader :data, :pointer

    def initialize(data, pointer = nil)
        @data = data
        @pointer = pointer
    end

    def set_pointer(node)
        @pointer = node
    end

    def get_pointer
        @pointer
    end

    def next?
        !@pointer.nil?
    end
end

class Singly_Linked_List
    def initialize(data)
        @head = Node.new(data, nil)
    end

    def is_empty?
        @head.nil?
    end

    def insert_node_at_end(data)
        current_node = @head
        while current_node.next?
            current_node = current_node.get_pointer
        end
        new_node = Node.new(data, nil)
        current_node.set_pointer(new_node)
    end

    def insert_node_at_beginning(data)
        head_pointer = @head.next? ? @head.get_pointer : nil
        @head = Node.new(data, head_pointer)
    end

    def reverse_list
        current_node = @head
        previous_node = nil
        next_node = nil
        while current_node
            next_node = current_node.pointer
            current_node.set_pointer(previous_node)
            previous_node = current_node
            current_node = next_node
        end
        @head = previous_node
    end

    def display
        current_node = @head
        while current_node.next?
            p current_node.data
            current_node = current_node.pointer
        end
        p current_node.data
    end

    def delete_from_beginnning
        current_node = @head
        @head = @head.get_pointer
        current_node = nil
    end

    def delete_from_end
        current_node = @head
        previous_node = current_node
        while current_node.next?
            previous_node = current_node
            current_node = current_node.get_pointer
        end
        previous_node.set_pointer(nil)
        current_node = nil
    end

    def create_loop
        current_node = @head
        while current_node.next?
            p current_node.data
            current_node = current_node.get_pointer
        end
        current_node.set_pointer(@head.get_pointer)
    end

    def loop_detection
        first_pointer = @head
        second_pointer = @head
        while second_pointer && second_pointer.next?
            if first_pointer.eql?(second_pointer) && !first_pointer.eql?(@head)
                return 'Loop detected'
            end
            first_pointer = first_pointer.get_pointer
            second_pointer = second_pointer.get_pointer.get_pointer
        end
        'No Loop Found!'
    end

    def
end

linked_list = Singly_Linked_List.new(1)
(2..4).each {|x| linked_list.insert_node_at_end(x)}
puts "forward!"
linked_list.insert_node_at_beginning(11)
linked_list.display
linked_list.reverse_list
puts "reverse!"
linked_list.display
p 'Delete from beginning'
linked_list.delete_from_beginnning
linked_list.display
p 'Delete from end'
linked_list.delete_from_end
linked_list.display
p 'Create loop'
linked_list1 = Singly_Linked_List.new(11)
(12..14).each { |x| linked_list1.insert_node_at_end(x) }
linked_list1.create_loop
# linked_list1.display
p 'Loop detection'
p linked_list.loop_detection
p linked_list1.loop_detection
# linked_list.display
