require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if @parent != nil
            @parent.children.delete(self)
        end
        if node == nil
            @parent = nil
            return
        end
        @parent = node
        @parent.children << self
    end
        
    def add_child(node)
        node.parent = self
    end

    def remove_child(node) 
        if @children.include?(node)
            node.parent = nil
        else
            raise "Child not found"
        end
    end

    def dfs(value)
        return self if @value == value
        @children.each do |node|
            target = node.dfs(value)
            return target if target != nil
        end
        nil
    end

    def bfs(value)
        queue = [self] 
        while !queue.empty?
            target = queue.shift 
            return target if target.value == value  
            queue.concat(target.children) 
        end
        nil
    end
end