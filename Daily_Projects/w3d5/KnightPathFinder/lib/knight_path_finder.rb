require_relative "./00_tree_node.rb"
class KnightPathFinder
    def self.valid_moves(pos)
        x,y = pos
        moves = [PolyTreeNode.new([x-2,y-1]),
                PolyTreeNode.new([x-2,y+1]),
                PolyTreeNode.new([x+2,y-1]),
                PolyTreeNode.new([x+2,y+1]),
                PolyTreeNode.new([x-1,y-2]),
                PolyTreeNode.new([x-1,y+2]),
                PolyTreeNode.new([x+1,y-2]),
                PolyTreeNode.new([x+1,y+2])]
        moves.select! { |move| 
            move.value.none? {|ele| ele < 0} && 
            move.value.none? {|ele| ele > 7} 
        }
        return moves
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(node)
        moves = KnightPathFinder.valid_moves(node.value)
        moves.select! do |move| 
            !@considered_positions.include?(move.value)
        end
        moves.each do |move|
            node.add_child(move)
            @considered_positions << move.value
        end
        moves
    end

    def find_path(pos)
        path = []
        queue = [@root_node]
        target_node = nil
        while !queue.empty?
            node = queue.shift
            target_node = node if node.value == pos
            queue.concat(self.new_move_positions(node))
        end
        while target_node.parent != nil
            path.unshift(target_node.value)
            target_node = target_node.parent
        end
        path.unshift(@root_node.value)
        path
    end
end

kfs = KnightPathFinder.new([0,0])
p kfs.find_path([6,7])
