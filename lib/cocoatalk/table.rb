require_relative 'value'
require_relative 'property'

module Cocoatalk
  class Table
    def self.version
      "#{Value.version}::0.0.2"
    end

    def initialize(name)
      @name = snake_to_camel(name)
      @value = Value.new(@name)
    end

    def integer(name, options={})
      @value.add_property(Property.new(name, "assign", "NSInteger", true))
    end

    def string(name, options={})
      @value.add_property(Property.new(name, "copy", "NSString"))
    end

    def datetime(name, options={})
      @value.add_property(Property.new(name, "assign", "NSTimeInterval", true))
    end

    def date(name, options={})
      @value.add_property(Property.new(name, "strong", "NSDate"))
    end

    def boolean(name, options={})
      @value.add_property(Property.new(name, "assign", "BOOL", true))
    end

    def text(name, options={})
      @value.add_property(Property.new(name, "copy", "NSString"))
    end

    def decimal(name, options={})
      @value.add_property(Property.new(name, "assign", "CGFloat", true))
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
  end
end