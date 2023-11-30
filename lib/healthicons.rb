# frozen_string_literal: true

require_relative 'healthicons/version'

require_relative 'healthicons/errors'
require_relative 'healthicons/icon'
require_relative 'healthicons/transform'       # Used for adding, modifying, and/or modifying attributes to the SVG icon
require_relative 'healthicons/rails/railtie'   # Used to initialize and lazyload the applications views
require_relative 'healthicons/rails/view_helpers'
require 'active_support/core_ext/object/blank'

module Healthicons
  class Error < StandardError; end

  SOLID_ICON_PATH = File.join(File.dirname(__FILE__), 'healthicons', 'icons', 'solid')
  OUTLINE_ICON_PATH = File.join(File.dirname(__FILE__), 'healthicons', 'icons', 'outline')
end
