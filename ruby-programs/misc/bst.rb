class BST
  class Node
    attr_reader :key, :left, :right

    def initialize(key)
      @key = key
      @left = nil
      @right = nil
    end

    def insert(new_key)
      if new_key <= @key
        @left.nil? ? @left = Node.new(new_key) : @left.insert(new_key)
      else
        @right.nil? ? @right = Node.new(new_key) : @right.insert(new_key)
      end
    end
  end

  def initialize
    @root = nil
  end

  def insert(key) 
    if @root.nil?
      @root = Node.new(key)
    else
      @root.insert(key)
    end
  end

  def preorder(node = @root, &block)
    return if node.nil?
    yield node
    inorder(node.left, &block)
    inorder(node.right, &block)
  end

  def inorder(node = @root, &block)
    return if node.nil?
    inorder(node.left, &block)
    yield node
    inorder(node.right, &block)
  end

  def postorder(node = @root, &block)
    return if node.nil?
    inorder(node.left, &block)
    inorder(node.right, &block)
    yield node
  end

  def search(key, node = @root)
    return if node.nil?
    if key < node.key
      search(key, node.left)
    elsif key > node.key
      search(key, node.right)
    else
      node
    end
  end

  def delete(key, node = @root)
    return if node.nil?
    node_to_be_deleted = search(key)
    if key < node.key
      node.left = delete(key, node.left)
    elsif key > node.key
      node.right = delete(key, node.right)
    else
      if node.right.nil?
        temp = node.left
        node = nil
        return node
      elsif node.left.nil?
        temp = node.right
        node = nil
        return node
      end
      #Node with two children
      temp = minValueNode(node.right)

      node.key = temp.key
      # delete the node which is moved as parent of right node
      node.right = delete(temp.key, node.right)
    end
    node
  end

  def minValueNode(node)
    current = node 
    while !current.left.nil?
      current = current.left
    end
    current
  end
end


tree = BST.new
tree.insert(50)
tree.insert(25)
tree.insert(75)
tree.insert(12)
tree.insert(37)
puts tree.inspect
print "\n\n"

puts tree.search(12)


tree.preorder { |node| puts node.key }
print "\n\n"
tree.inorder { |node| puts node.key }
print "\n\n"
tree.delete(75)
tree.inorder { |node| puts node.key }



