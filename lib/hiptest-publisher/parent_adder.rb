module Hiptest
  module Nodes
    class ParentAdder < Walker
      def self.add(project)
        Hiptest::Nodes::ParentAdder.new().walk_node(project)
      end

      def walk_node(node)
        super(node)
        return unless node.is_a? Hiptest::Nodes::Node

        node.direct_children.each {|child|
          child.parent ||= node
        }
      end
    end
  end
end
