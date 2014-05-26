require_relative 'property'
require_relative 'types'
require_relative 'value'

module Cocoatalk
  class Table
    def self.version
      "#{Value.version}::0.0.3"
    end

    def initialize(name, type_store, options={})
      generic_singular = name_to_singular(name)
      options = {singular: generic_singular}.merge options
      @name = snake_to_camel(options[:singular], true)
      @value = Value.new(@name)
      @type_store = type_store
      @type_store.set options[:singular], @name
    end

    def integer(name, options={})
      options = {primative: true}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "assign", Types::DSL_TO_NS[__method__], options))
    end

    def string(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "copy", Types::DSL_TO_NS[__method__], options))
    end

    def datetime(name, options={})
      options = {primative: true}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "assign", Types::DSL_TO_NS[__method__], options))
    end

    def date(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "strong", Types::DSL_TO_NS[__method__], options))
    end

    def boolean(name, options={})
      options = {primative: true}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "assign", Types::DSL_TO_NS[__method__], options))
    end

    def text(name, options={})
      @value.add_property(Property.new(snake_to_camel(name), "copy", Types::DSL_TO_NS[__method__], options))
    end

    def decimal(name, options={})
      options = {primative: true}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "assign", Types::DSL_TO_NS[__method__], options))
    end

    def array(name, value_type, options={})
      options = {collection: true, value_type: value_type, type_store: @type_store}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "copy", Types::DSL_TO_NS[__method__], options))
    end

    def dictionary(name, value_type, options={})
      options = {collection: true, value_type: value_type, type_store: @type_store}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "copy", Types::DSL_TO_NS[__method__], options))
    end

    def object(name, type, options={})
      options = {copying: true, type_store: @type_store}.merge options
      copying = options[:copying]
      property = Property.new(snake_to_camel(name), copying ? "copy" : "strong", type, options)
      @value.add_property(property)
    end

    def enum(name, type, options={})
      options = {primative: true, type_store: @type_store}.merge options
      @value.add_property(Property.new(snake_to_camel(name), "assign", type, options))
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