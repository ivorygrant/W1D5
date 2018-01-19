class PolyTreeNode
require 'byebug'  
  attr_reader :parent, :children, :value
  
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(new_parent)
    old_parent = @parent #set the old parent equal to current parent
    old_parent.children.delete(self) unless old_parent.nil? #delete the child from parent unless nil
    @parent = new_parent #set @parent with passed new_parent
    unless @parent.nil? #unless new_parent is nil (no more parents?)
      @parent.children << self unless @parent.children.include?(self) #add self unless already there
    end
  end
  
  def add_child(child_node)
    child_node.parent = self  #use parent= method to set child node to self
  end 
  
  def remove_child(child_node)
    child_node.parent = nil #use parent= method to assign child node to nil, since already deleted line 14
    raise "Not a child" if child_node.parent == nil #raise if child_node is nil
  end 
  
  def dfs(target)
  #base
  # return self if self.value == target
  # 
  # unless self.children == nil
  #   @children.each {|child| return self if dfs(target) == target}
  
    if self.value == target
      return self
    else
      @children.each do |child|
        result = child.dfs(target)
        return result unless result.nil?
      end
      return nil
    end
  
  end
end