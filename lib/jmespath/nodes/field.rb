module JMESPath
  # @api private
  module Nodes
    class Field < Leaf
      attr_reader :key

      def initialize(key)
        @key = key
      end

      def visit(value)
        case value
        when Hash then value.key?(@key) ? value[@key] : value[@key.to_sym]
        when Struct then value.respond_to?(@key) ? value[@key] : nil
        else nil
        end
      end

      def to_h
        {
          :type => :field,
          :key => @key,
        }
      end
    end
  end
end