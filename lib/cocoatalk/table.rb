require_relative 'value'
require_relative 'property'

module Cocoatalk
  class Table
    def self.version
      "#{Value.version}::0.0.3"
    end

    def initialize(name, options={})
      generic_singular = name_to_singular(name)
      options = {singular: generic_singular}.merge options
      @name = snake_to_camel(options[:singular], true)
      @value = Value.new(@name)
    end

    def integer(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "assign", "NSInteger", primative: true))
    end

    def string(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "copy", "NSString"))
    end

    def datetime(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "assign", "NSTimeInterval", primative: true))
    end

    def date(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "strong", "NSDate"))
    end

    def boolean(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "assign", "BOOL", primative: true))
    end

    def text(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "copy", "NSString"))
    end

    def decimal(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "assign", "CGFloat", primative: true))
    end

    def array(name, value_type, options={})
      @value.add_property(Property.new(snake_to_camel(name), "copy", "NSArray", collection: true, value_type: value_type))
    end

    def dictionary(name, value_type, options={})
      @value.add_property(Property.new(snake_to_camel(name), "copy", "NSDictionary", collection: true, value_type: value_type))
    end

    def object(name, type, copying=true, options={})
      @value.add_property(Property.new(snake_to_camel(name), copying ? "copy" : "strong", type))
    end

    def enum(name, type, options={})
      @value.add_property(Property.new(snake_to_camel(name), "assign", type, primative: true))
    end

    def build(prefix, signature)
      @value.build(prefix, signature)
    end

    def interface
      @value.interface
    end

    def implementation
      @value.implementation
    end

    def name(prefix)
      prefix + @name
    end

    private
      def snake_to_camel(str, upcase_first=false)
        parts = str.split('_')
        return parts.map(&:capitalize).join("") if upcase_first
        [parts[0], parts[1..-1].map(&:capitalize)].join("")
      end

      def name_to_singular(str)
        return str[0..-3] if str.length > 2 and str[-2..-1] == 'es'
        return str[0..-2] if str.length > 1 and str[-1] == 's'
        return str
      end
  end
end