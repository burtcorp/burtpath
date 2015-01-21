module JMESPath
  # @api private
  module Nodes
    class Condition < Node
      def visit(value)
        if @children[0].visit(value)
          @children[1].visit(value)
        else
          nil
        end
      end

      def to_h
        {
          :type => :condition,
          :children => @children.map(&:to_h),
        }
      end
    end
  end
end