class BinaryTree
  require_relative 'node'

  attr_reader :root_node
  
  def initialize data
    @root_node = Node.new(data.shift)
    build_tree data
  end

  def add_node (node, parent_node)
    if node.value < parent_node.value
      if parent_node.left_node == nil
        parent_node.left_node = node
        node.parent_node = parent_node
      else
        add_node(node, parent_node.left_node)
      end
    else
      if parent_node.right_node == nil
        parent_node.right_node = node
        node.parent_node = parent_node
      else
        add_node(node, parent_node.right_node)
      end
    end
  end

  def build_tree data
    data.each do |i|
      node = Node.new(i)
      add_node(node, @root_node)
    end
  end

  # Simplified breadth_first_search used to reset 'is_visited' property of every node
  # 'is_visited' is not necessary for our purpose but could be useful later
  def reset_tree
    queue = [@root_node]

    while !queue.empty?
      node = queue.shift
      node.is_visited = false
      queue << node.left_node unless node.left_node.nil?
      queue << node.right_node unless node.right_node.nil?
    end
    return nil
  end

  def breadth_first_search target
    queue = [@root_node]
    visited = []

    while !queue.empty?
      node = queue.shift
      return "Found target : #{target} at node #{node}"  if node.value == target
      if !node.is_visited
        visited << node.value
        node.is_visited = true
        queue << node.left_node unless node.left_node.nil?
        queue << node.right_node unless node.right_node.nil?
      end
    end
    return nil
  end

  def depth_first_search target
    stack = [@root_node]
    visited = []

    while !stack.empty?
      node = stack[-1]
      return "Found target : #{target} at node #{node}"  if node.value == target
      if !node.is_visited
        visited << node.value
        node.is_visited = true
        stack << node.left_node unless node.left_node.nil?
        stack << node.right_node unless node.right_node.nil?
      end
    end
    return nil
  end

  def dfs_rec(target, node)
    return "Found target : #{target} at node #{node}"  if node.value == target

    left_node_search = dfs_rec(target, node.left_node) unless node.left_node.nil?
    return left_node_search unless left_node_search.nil?
    right_node_search = dfs_rec(target, node.right_node) unless node.right_node.nil?
    return right_node_search unless right_node_search.nil?
  end

end

arr = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]

tree = BinaryTree.new (arr)
puts tree.breadth_first_search 67
tree.reset_tree
puts tree.depth_first_search 67
puts tree.dfs_rec 67, (tree.root_node)


