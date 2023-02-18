
class PolyTreeNode

  
  attr_accessor :value, :parent, :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(par)
    @parent.children.delete(self) if !@parent.nil? && par != @parent
    # @parent.children.delete(self) if !@parent.nil?
    # @children.delete(self)
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
    child.parent=(nil) 
    @children.delete(child)
  end

  def dfs(search_value)
    return self if @value == search_value
    @children = self.children
    
    @children.each do |child|
      result = child.dfs(search_value)
      return result if !result.nil?
    end

    nil
  end

  def bfs(search_value)
    return self if @value == search_value
    q = [self]
    until q.empty?
      check_node = q.shift
      return check_node if check_node.value == search_value
      q.concat(check_node.children)
    end
    nil
  end

end