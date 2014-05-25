module Cocoatalk
  class Types

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

  end
end