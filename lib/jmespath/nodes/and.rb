module JMESPath
  # @api private
  module Nodes
    class And < Node
      def initialize(left, right)
        @left = left
        @right = right
      end

      def visit(value)
        result = @left.visit(value)
        if result && (!result.respond_to?(:empty?) || !result.empty?)
          @right.visit(value)
        end
      end

      def optimize
        self.class.new(@left.optimize, @right.optimize)
      end
    end
  end
end
