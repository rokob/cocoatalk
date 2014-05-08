require 'erb'
require_relative 'execution_context'

module Cocoatalk
  class ImmutableObject
    attr_reader :interface, :implementation

    def initialize(interface="", implementation="")
      @interface = interface
      @implementation = implementation
    end

    def build(hash)
      context = ExecutionContext.new(hash).get_binding
      @interface = result('templates/value_object.h.erb', context)
      @implementation = result('templates/value_object.m.erb', context)
    end

    def result(filepath, context)
      file = File.read(File.expand_path("../#{filepath}", __FILE__))
      ERB.new(file, 0, "%<>-").result(context)
    end
  end
end