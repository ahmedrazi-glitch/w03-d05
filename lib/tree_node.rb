
class PolyTreeNode

  
  attr_reader :value, :parent, :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(par)
    @parent.remove_child(self) if !@parent.nil? && par != @parent
    
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
    child.parent = self
    self
  end

  def remove_child(child)
    raise 'I dont have you as a child' if !@children.include?(child)
    #child.parent=(nil) 
    @children.delete(child)
  end

end