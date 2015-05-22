class Node
  
  attr_reader :value
  attr_accessor :parent_node
  attr_accessor :left_node
  attr_accessor :right_node

  def initialize value
    @value = value
  end

end