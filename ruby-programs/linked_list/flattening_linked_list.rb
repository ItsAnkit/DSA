require 'pry'

class Node
    attr_reader :data, :next_ptr, :bottom_ptr

    def initialize(data, next_ptr = nil, bottom_ptr = nil)
        @data = data
        @next_ptr = next_ptr
        @bottom_ptr = bottom_ptr
    end

    def set_next_ptr(node)
        @next_ptr = node
    end

    def set_bottom_ptr(node)
        @bottom_ptr = node
    end

    def get_next_ptr
        @next_ptr
    end

    def get_bottom_ptr
        @bottom_ptr
    end

    def next?
        !@next_ptr.nil?
    end

    def bottom?
        !@bottom_ptr.nil?
    end
end

class FlatteningLinkedList
    def initialize(data = nil)
        @head = data ? Node.new(data) : nil
    end

    def is_empty?
        @head.nil?
    end

    def insert_node_at_end(data)
        current_head = @head
        unless current_head.nil?
          while current_head.next?
            current_head = current_head.get_next_ptr
          end
          new_node = Node.new(data)
          current_head.set_next_ptr(new_node)
        else
          @head = Node.new(data)
        end
    end

    def insert_node_at_bottom(data, node_number)
        count = 0
        current_node = @head
        unless current_node.nil?
            while count < node_number
                current_node = current_node.get_next_ptr
            end
            while current_node.bottom?
                current_node = current_node.get_bottom_ptr
            end
            new_node = Node.new(data, nil, nil)
            current_node.set_bottom_ptr(new_node)
        end
    end

    # def flatten
    #     bottom_traverser = @head
    #     horizontal_traverser = @head
    #     while horizontal_traverser.next?
    #         if bottom_traverser && bottom_traverser.get_bottom_ptr.data < horizontal_traverser.get_next_ptr.data
    #             bottom_traverser = bottom_traverser.get_bottom_ptr
    #             p bottom_traverser.data
    #         elsif horizontal_traverser && bottom_traverser.get_bottom_ptr.data > horizontal_traverser.get_next_ptr.data
    #             horizontal_traverser = horizontal_traverser.get_next_ptr
    #             p horizontal_traverser.data
    #         elsif horizontal_traverser.next

    #         end

    #     end
    # end

    def display
        base_node = @head
        binding.pry
        while base_node.next?
            current_node = base_node
            p current_node.data
            while current_node.bottom?
                current_node = current_node.get_bottom_ptr
                p current_node.data
            end
            base_node = base_node.get_next_ptr
        end
    end
end

p 'insert data'
counts = '4 2 3 4'
data = '5 7 8 30 10 20 19 22 50 28 35 40 45'
counts_array = counts.split(' ').map(&:to_i)
data_array = data.split(' ').map(&:to_i)
dl = FlatteningLinkedList.new(data_array[0])
vertical_counter = 0
horizontal_counter = counts_array[vertical_counter]
count = 0
data_array.drop(1).each do |data|
    if count < horizontal_counter
        dl.insert_node_at_bottom(data, counts_array.index(horizontal_counter))
    else
        vertical_counter += 1
        horizontal_counter = counts_array[vertical_counter]
        dl.insert_node_at_end(data)
        count = 0
    end
end
dl.display
