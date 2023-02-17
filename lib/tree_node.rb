class PolyTreeNode
  
  attr_reader :value, :parent, :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(par)

    @parent = par
    
  end

  def add_child(child)
    @children << child
    self   
  end


end