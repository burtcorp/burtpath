module JMESPath
  module Errors

    class Error < StandardError; end

    class SyntaxError < Error; end

    class InvalidValueError < Error; end

    class InvalidTypeError < Error; end

    class InvalidArityError < Error; end

    class UnknownFunctionError < Error; end

  end
end
