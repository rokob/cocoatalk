module Cocoatalk
  module Types

    DSL_TO_NS =
    {
      string:     'NSString',
      integer:    'NSInteger',
      datetime:   'NSTimeInterval',
      date:       'NSDate',
      boolean:    'BOOL',
      text:       'NSString',
      decimal:    'CGFloat',
      array:      'NSArray',
      dictionary: 'NSDictionary'
    }

    DSL_TO_SWIFT =
    {
      string:     'String',
      integer:    'Int',
      datetime:   'Double',
      date:       'NSDate',
      boolean:    'Bool',
      text:       'String',
      decimal:    'Float',
      array:      'Array',
      dictionary: 'Dictionary'
    }

    NS_TO_PRIMATIVE =
    {
      'NSInteger'      => 'Integer',
      'NSTimeInterval' => 'Double',
      'CGFloat'        => 'Float',
      'BOOL'           => 'Bool',
      'NSString'       => 'Object',
      'NSArray'        => 'Object',
      'NSDictionary'   => 'Object'
    }

    SWIFT_TO_PRIMATIVE =
    {
      'Integer' => 'Integer',
      'Double'  => 'Double',
      'Float'   => 'Float',
      'Bool'    => 'Bool'
    }

    module Language
      OBJC = 'objc'
      SWIFT = 'swift'

      ALL = [OBJC, SWIFT]
    end
  end

  class TypeStore
    include Enumerable

    def initialize
      @types = {}
    end

    def set(singular, type)
      @types[singular] = type
    end

    def get(singular)
      @types[singular]
    end

    def each(&block)
      @types.each do |singular, type|
        block.call(singular, type) if block_given?
        yield singular, type unless block_given?
      end
    end
  end
end