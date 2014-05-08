require_relative 'immutable_object'
require_relative 'property'

object = Cocoatalk::ImmutableObject.new

object.build({
      name: "RKValue",
      mutableName: "RKMutableName",
      signature: "/// @generated @signature<<0xfaceb00k>>",
      properties: [
        Cocoatalk::Property.new('builderId', 'copy', 'NSString'),
        Cocoatalk::Property.new('createdAt', 'assign', 'NSTimeInterval', true),
        Cocoatalk::Property.new('name', 'copy', 'NSString'),
        Cocoatalk::Property.new('isDone', 'assign', 'BOOL', true)
      ]
    })

puts object.interface
puts object.implementation