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
      @name = snake_to_camel(options[:singular])
      @value = Value.new(@name)
    end

    def integer(name, options={})
      @value.add_property(Property.new(name, "assign", "NSInteger", primative: true))
    end

    def string(name, options={})
      @value.add_property(Property.new(name, "copy", "NSString"))
    end

    def datetime(name, options={})
      @value.add_property(Property.new(name, "assign", "NSTimeInterval", primative: true))
    end

    def date(name, options={})
      @value.add_property(Property.new(name, "strong", "NSDate"))
    end

    def boolean(name, options={})
      @value.add_property(Property.new(name, "assign", "BOOL", primative: true))
    end

    def text(name, options={})
      @value.add_property(Property.new(name, "copy", "NSString"))
    end

    def decimal(name, options={})
      @value.add_property(Property.new(name, "assign", "CGFloat", primative: true))
    end

    def array(name, value_type, options={})
      @value.add_property(Property.new(name, "copy", "NSArray", collection: true, value_type: value_type))
    end

    def dictionary(name, value_type, options={})
      @value.add_property(Property.new(name, "copy", "NSDictionary", collection: true, value_type: value_type))
    end

    def object(name, type, copying=true, options={})
      @value.add_property(Property.new(name, copying ? "copy" : "strong", type))
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
      def snake_to_camel(str)
        str.split("_").map(&:capitalize).join("")
      end

      def name_to_singular(str)
        str
      end
  end
end