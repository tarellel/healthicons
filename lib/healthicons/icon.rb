# frozen_string_literal: true

require 'active_support/core_ext/object/blank'

module Healthicons
  class Icon
    VARIANTS = %i[outline solid].freeze
    attr_accessor :name, :variant, :options

    # Generate a new instance of Healthicons and render the SVG icon
    #
    # @param icon [String] The icon image name
    # @param options [Hash](optional)
    # @return [String] the rendered icons SVG/XML contents
    def self.call(icon, options = {})
      new(icon, options).render
    end

    # Instantize an icons attributes
    #
    # @param icon [String] The icon image name
    # @param options [Hash](optional)
    def initialize(icon, options = {})
      @variant = variant_check(options[:variant])
      @name = icon.to_s
      @options = options
    end

    # Return the SVG icons contents
    #
    # @return [String]
    def render
      return '' if svg_file_contents.blank?

      Healthicons::Transform.call(svg_file_contents, @options)
    end

    private

    # Verify a valid variant has been supplied
    #
    # @param variant [String, Symbol]
    # @return [String, Symbol]
    def variant_check(variant = :outline)
      return variant.to_sym if variant && Healthicons::Icon::VARIANTS.include?(variant.to_sym)

      :outline
    end

    # Ensure that no filenames escaping the current director can be used
    # In order to prevents someone from forcing the application to display contents of file in other folder, such as database.yml
    #
    # @return [String]
    def safe_filename
      @_safe_filename ||= if @name.blank?
                            ''
                          else
                            # Removes filenames that start with `.svg`, `./`svg, '../svg', or '/svg'
                            "#{@name&.gsub(%r{^[./]+/?}, '')}.svg"
                          end
    end

    # Generate the icons file path
    #
    # @return [String]
    def file_path
      if solid?
        File.join(Healthicons::SOLID_ICON_PATH, safe_filename)
      else
        File.join(Healthicons::OUTLINE_ICON_PATH, safe_filename)
      end
    end

    # Returm the SVG file contents from the file
    #
    # @return [String] SVG/XML file contents
    def svg_file_contents
      @_svg_file_contents ||= if File.exist?(file_path)
                                File.read(file_path).force_encoding('UTF-8')
                              else
                                raise Healthicons::Errors::UnknownIcon, "Icon '#{@name}' could not be found."
                              end
    end

    # Used to determine if the icons variant is outline
    #
    # @return [Boolean]
    def outline?
      @variant == :outline
    end

    # Used to determine if the icons variant is solid
    #
    # @return [Boolean]
    def solid?
      @variant == :solid
    end
  end
end
