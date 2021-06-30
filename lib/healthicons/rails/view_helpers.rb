# frozen_string_literal: true

module Healthicons
  module Rails
    module ViewHelpers
      # Allow the healthcare icon to be called in rails, so icons can be added to the views
      #
      # @param icon [String] icon image name
      # @param options [Hash] additional attributes you want to apply to the SVG
      # @return [String] the SVG/XML contents of the icon
      def healthicon(icon, **options)
        Healthicons::Icon.call(icon, options)&.html_safe
      end
    end
  end
end
