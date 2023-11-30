# frozen_string_literal: true

module Healthicons
  module Errors
    class UnknownIcon < StandardError
      # Create an error for an unknwon icon
      #
      # @param icon [String]
      # @return [String]
      def initialize(icon = '')
        msg = "The #{icon} icon could not be found."
        super(msg)
      end
    end

    # Used to generate an exception if an unknown varient was supplied
    class UndefinedVariant < StandardError; end
  end
end
