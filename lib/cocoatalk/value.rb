require 'erb'
require_relative 'execution_context'

module Cocoatalk
  class Value
    attr_reader :interface, :implementation

    def self.version
      '0.0.2'
    end

    def initialize(name)
      @name = name
      @properties = []
    end

    def add_property(property)
      @properties << property
    end

    def build(prefix, signature)
      hash = value_as_hash(prefix, signature)
      build_with_hash hash
    end

    def build_with_hash(hash)
      context = ExecutionContext.new(hash).get_binding
      @interface = result('templates/value_object.h.erb', context)
      @implementation = result('templates/value_object.m.erb', context)
    end

    def result(filepath, context)
      file = File.read(File.expand_path("../#{filepath}", __FILE__))
      ERB.new(file, 0, "%<>-").result(context)
    end

    private
      def value_as_hash(prefix, signature)
        name = prefix + @name
        {
          name: name,
          signature: signature,
          properties: @properties,
          prefix: prefix
        }
      end
  end
end