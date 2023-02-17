class PolyTreeNode
  
  attr_reader :value, :parent, :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(par)
    # @parent.remove_child(self) if !@parent.nil? 
    
    @parent = par
    if !@parent.nil? && !@parent.children.include?(self)
      @parent.add_child(self)
    end

    @parent
  end

  def add_child(child)
    if !@children.include?(child)
      @children << child
    end
    self
  end


end