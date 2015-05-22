class Node

  attr_reader :value
  attr_accessor :parent_node
  attr_accessor :left_node
  attr_accessor :right_node
  attr_accessor :is_visited
  attr_accessor :children

  def initialize value
    @value = value
    @is_visited = false
  end

end