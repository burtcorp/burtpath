module JMESPath
  # @api private
  module Nodes
    class Not < Node
      def initialize(expression)
        @expression = expression
      end

      def visit(value)
        !@expression.visit(value)
      end
    end
  end
end
