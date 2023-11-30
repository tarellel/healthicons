# frozen_string_literal: true

require 'nokogiri'
require 'active_support/core_ext/object/blank'

module Healthicons
  class Transform
    DEFAULT_OPTIONS = { 'aria-hidden' => true, stroke: 'currentColor', focusable: false, role: 'img', size: 24 }.freeze
    HEIGHT_AND_WIDTH = %i[height width].freeze
    KEYS_TO_REMOVE = %i[height width variant viewbox xmlns].freeze

    attr_accessor :svg, :options

    # @param svg [String]
    # @param options [Hash]
    # @return [String]
    def self.call(svg, options = {})
      new(svg, options).render
    end

    # Used when transforming a new SVG::XML icon
    #
    # @param svg [String]
    # @param options [Hash]
    def initialize(svg, options = {})
      @svg = parse_icon_content(svg)
      @options = cleanup_options(options)
    end

    # Generate and return the SVG's altered XML contents
    #
    # @return [String]
    def render
      return '' if @svg.blank?

      add_icon_options
      # used to ensure icons with missing </path> have it added to ensure IE compatibiltiy
      @svg&.to_html(&:no_empty_tags)
    end

    private

    # Cleanup the options hash by removing unecessary values and appling defaults if they are missing
    #
    # @param options [Hash]
    # @return [Hash]
    def cleanup_options(options = {})
      options = {} unless options.is_a?(Hash)

      add_default_options(scrub_options(options))
    end

    # Apply defaults to the options hash
    #
    # @param options [Hash]
    # @return [Hash]
    def add_default_options(options)
      DEFAULT_OPTIONS.merge(options)
    end

    # Remove height and width attrbutes, since the SVG needs to have the same height/size
    #   To change the icons size you need to specify the icons size with `size:`
    #
    # @param options [Hash]
    # @return [Hash]
    def scrub_options(options = {})
      return {} unless options.is_a?(Hash)

      KEYS_TO_REMOVE.each { |k| options.delete(k) }
      options
    end

    # Loop through any and all options and add them to the <svg> element
    #
    # @return [Hash]
    def add_icon_options
      return if @options.blank? || !options.is_a?(Hash)

      set_size_and_width
      @options = @options.reject { |k| k == :size }
      @options.each do |key, val|
        set_icon_attribute(key, val)
      end
    end

    # Set the SVG icons height weight based on size,
    #   This is because they need to be proportionate to eachother
    #
    # @return [Hash]
    def set_size_and_width
      HEIGHT_AND_WIDTH.map { |k| set_icon_attribute(k, @options[:size].to_i) }
    end

    # Used to add the attribute/value to the SVG
    #
    # @param attr [String]
    # @param val [String]
    # @return [Hash]
    def set_icon_attribute(attr, val)
      @svg.child.set_attribute(attr, val.to_s)
    end

    # Load and parse icon XML contents with Nokogiri
    #
    # @param icon_contents [String]
    # @return [String]
    # @note
    #   https://nokogiri.org/tutorials/modifying_an_html_xml_document.html
    #   https://nokogiri.org/rdoc/Nokogiri/XML/Builder.html
    #   https://www.rubydoc.info/github/sparklemotion/nokogiri/Nokogiri/XML/Node
    def parse_icon_content(icon_contents)
      Nokogiri::HTML::DocumentFragment.parse(icon_contents) # allow it's child attributes/tags to be accessible
    rescue
      ''
    end

    # Set the icons width/height
    #
    # @return [String, Integer]
    def size
      options[:size].presence
    end
  end
end
