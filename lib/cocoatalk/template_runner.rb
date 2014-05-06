require 'erb'

module Helpers
  def upcase_first(str)
    str[0].upcase + str[1..-1]
  end
end

class ExecutionContext
  include Helpers

  def initialize(hash)
    hash.each do |key, value|
      singleton_class.send(:define_method, key) { value }
    end
  end

  def get_binding
    binding
  end
end

class Property
  attr_reader :name, :memory, :type
  def initialize(name, memory, type)
    @name = name
    @memory = memory
    @type = type
  end
end

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

object = ImmutableObject.new
object.build({
      name: "RKValue",
      mutableName: "RKMutableName",
      signature: "/// @generated @signature<<0xfaceb00k>>",
      properties: [
        Property.new('builderId', 'copy', 'NSString*'),
        Property.new('createdAt', 'assign', 'NSTimeInterval'),
        Property.new('name', 'copy', 'NSString*')
      ]
    })

puts object.interface
puts object.implementation
