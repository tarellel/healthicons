# typed: strong
module Healthicons
  SOLID_ICON_PATH = T.let(File.join(File.dirname(__FILE__), 'healthicons', 'icons', 'solid'), T.untyped)
  OUTLINE_ICON_PATH = T.let(File.join(File.dirname(__FILE__), 'healthicons', 'icons', 'outline'), T.untyped)
  VERSION = T.let('0.0.8', T.untyped)

  class Error < StandardError
  end

  class Icon
    VARIANTS = T.let(%i[outline solid].freeze, T.untyped)

    # Generate a new instance of Healthicons and render the SVG icon
    # 
    # _@param_ `icon` — The icon image name
    # 
    # _@param_ `options` — (optional)
    # 
    # _@return_ — the rendered icons SVG/XML contents
    sig { params(icon: String, options: T::Hash[T.untyped, T.untyped]).returns(String) }
    def self.call(icon, options = {}); end

    # Instantize an icons attributes
    # 
    # _@param_ `icon` — The icon image name
    # 
    # _@param_ `options` — (optional)
    sig { params(icon: String, options: T::Hash[T.untyped, T.untyped]).void }
    def initialize(icon, options = {}); end

    # Return the SVG icons contents
    sig { returns(String) }
    def render; end

    # Verify a valid variant has been supplied
    # 
    # _@param_ `variant`
    sig { params(variant: T.any(String, Symbol)).returns(T.any(String, Symbol)) }
    def variant_check(variant = :outline); end

    # Ensure that no filenames escaping the current director can be used
    # In order to prevents someone from forcing the application to display contents of file in other folder, such as database.yml
    sig { returns(String) }
    def safe_filename; end

    # Generate the icons file path
    sig { returns(String) }
    def file_path; end

    # Returm the SVG file contents from the file
    # 
    # _@return_ — SVG/XML file contents
    sig { returns(String) }
    def svg_file_contents; end

    # Used to determine if the icons variant is outline
    sig { returns(T::Boolean) }
    def outline?; end

    # Used to determine if the icons variant is solid
    sig { returns(T::Boolean) }
    def solid?; end

    # Returns the value of attribute name.
    sig { returns(T.untyped) }
    attr_accessor :name

    # Returns the value of attribute variant.
    sig { returns(T.untyped) }
    attr_accessor :variant

    # Returns the value of attribute options.
    sig { returns(T.untyped) }
    attr_accessor :options
  end

  module Errors
    class UnknownIcon < StandardError
      # Create an error for an unknwon icon
      # 
      # _@param_ `icon`
      sig { params(icon: String).void }
      def initialize(icon = ''); end
    end

    # Used to generate an exception if an unknown varient was supplied
    class UndefinedVariant < StandardError
    end
  end

  class Transform
    DEFAULT_OPTIONS = T.let({ 'aria-hidden' => true, stroke: 'currentColor', focusable: false, role: 'img', size: 24 }.freeze, T.untyped)
    HEIGHT_AND_WIDTH = T.let(%i[height width].freeze, T.untyped)
    KEYS_TO_REMOVE = T.let(%i[height width variant viewbox xmlns].freeze, T.untyped)

    # _@param_ `svg`
    # 
    # _@param_ `options`
    sig { params(svg: String, options: T::Hash[T.untyped, T.untyped]).returns(String) }
    def self.call(svg, options = {}); end

    # Used when transforming a new SVG::XML icon
    # 
    # _@param_ `svg`
    # 
    # _@param_ `options`
    sig { params(svg: String, options: T::Hash[T.untyped, T.untyped]).void }
    def initialize(svg, options = {}); end

    # Generate and return the SVG's altered XML contents
    sig { returns(String) }
    def render; end

    # Cleanup the options hash by removing unecessary values and appling defaults if they are missing
    # 
    # _@param_ `options`
    sig { params(options: T::Hash[T.untyped, T.untyped]).returns(T::Hash[T.untyped, T.untyped]) }
    def cleanup_options(options = {}); end

    # Apply defaults to the options hash
    # 
    # _@param_ `options`
    sig { params(options: T::Hash[T.untyped, T.untyped]).returns(T::Hash[T.untyped, T.untyped]) }
    def add_default_options(options); end

    # Remove height and width attrbutes, since the SVG needs to have the same height/size
    #   To change the icons size you need to specify the icons size with `size:`
    # 
    # _@param_ `options`
    sig { params(options: T::Hash[T.untyped, T.untyped]).returns(T::Hash[T.untyped, T.untyped]) }
    def scrub_options(options = {}); end

    # Loop through any and all options and add them to the <svg> element
    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def add_icon_options; end

    # Set the SVG icons height weight based on size,
    #   This is because they need to be proportionate to eachother
    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def set_size_and_width; end

    # Used to add the attribute/value to the SVG
    # 
    # _@param_ `attr`
    # 
    # _@param_ `val`
    sig { params(attr: String, val: String).returns(T::Hash[T.untyped, T.untyped]) }
    def set_icon_attribute(attr, val); end

    # Load and parse icon XML contents with Nokogiri
    # 
    # _@param_ `icon_contents`
    # 
    # _@note_ — https://nokogiri.org/tutorials/modifying_an_html_xml_document.html
    # https://nokogiri.org/rdoc/Nokogiri/XML/Builder.html
    # https://www.rubydoc.info/github/sparklemotion/nokogiri/Nokogiri/XML/Node
    sig { params(icon_contents: String).returns(String) }
    def parse_icon_content(icon_contents); end

    # Set the icons width/height
    sig { returns(T.any(String, Integer)) }
    def size; end

    # Returns the value of attribute svg.
    sig { returns(T.untyped) }
    attr_accessor :svg

    # Returns the value of attribute options.
    sig { returns(T.untyped) }
    attr_accessor :options
  end

  module Rails
    class Railtie < Rails::Railtie
    end

    module ViewHelpers
      # Allow the healthcare icon to be called in rails, so icons can be added to the views
      # 
      # _@param_ `icon` — icon image name
      # 
      # _@param_ `options` — additional attributes you want to apply to the SVG
      # 
      # _@return_ — the SVG/XML contents of the icon
      sig { params(icon: String, options: T::Hash[T.untyped, T.untyped]).returns(String) }
      def healthicon(icon, **options); end
    end
  end
end
