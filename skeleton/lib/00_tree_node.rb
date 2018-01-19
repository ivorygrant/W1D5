class PolyTreeNode
require 'byebug'  
  attr_reader :parent, :children, :value
  
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  # def parent
  #   parent = @parent
  # end
  # 
  # def children
  #   @children << 
  # end
  # 
  # def value
  # end
  # 
  def parent=(new_parent)
    old_parent = @parent
    old_parent.children.delete(self) unless old_parent.nil?
    @parent = new_parent
    unless @parent.nil?
      @parent.children << self unless @parent.children.include?(self)
    end
  end
  

end