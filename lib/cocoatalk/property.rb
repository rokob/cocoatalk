require_relative 'types'

module Cocoatalk
  class Property

    attr_reader :name, :memory, :primative, :collection

    BUILTIN = %w{ NSInteger NSUInteger NSString NSTimeInterval NSDate BOOL CGFloat NSArray NSDictionary }

    def initialize(name, memory, base_type, options={})
      default_options = {
        primative: false,
        indirection: nil,
        collection: false,
        value_type: nil,
        json_key: camel_to_snake(name)
      }
      options = default_options.merge options
      @name = name
      @memory = memory
      @base_type = base_type
      @builtin = BUILTIN.include?(base_type)
      @primative = options[:primative]
      @indirection = options[:indirection] || (options[:primative] ? 0 : 1)
      @collection = options[:collection]
      @collection_type = (base_type == 'NSArray' ? :array : :dictionary) if @collection
      @value_type = options[:value_type]
      @json_key = options[:json_key]
    end

    def type
      "#{@base_type}" + "*"*@indirection
    end

    def equality_string(other)
      if @indirection == 0
        "_#{@name}==#{other}->_#{@name}"
      elsif @primative
        "*_#{@name}==*(#{other}->_#{@name})"
      else
        "(_#{@name}==#{other}->_#{@name} || [_#{@name} isEqual:#{other}->_#{@name}])"
      end
    end

    def hash_string
      if @base_type.upcase == "BOOL" and @indirection == 0
        "(_#{@name} ? 1231 : 1237)"
      elsif @primative
        "(NSUInteger)(113*_#{@name})"
      else
        "[_#{@name} hash]"
      end
    end

    def coder_type_string
      (!@primative && 'Object') || Types::NS_TO_PRIMATIVE[@base_type] || 'Object'
    end

    def from_dictionary(dict_str)
      return "[temporaryCollection__ copy]" if @collection and !BUILTIN.include?(@value_type)

      value = "[#{dict_str} objectForKey:@\"#{@json_key}\"]"
      return value unless @primative

      number_type = coder_type_string.downcase + "Value"
      "[#{value} #{number_type}]"
    end

    def collection_from_dictionary(dict_str)
      @collection_type == :array ? from_dictionary_array(dict_str) : from_dictionary_dictionary(dict_str)
    end

    def from_dictionary_array(dict_str)
      return "" if BUILTIN.include?(@value_type)

      result =  "NSMutableArray *temporaryCollection__ = [NSMutableArray array];\n"
      result << "for (id objInArray in [#{dict_str} objectForKey:@\"#{@json_key}\"]) {\n"
      result << "  #{@value_type} constructedObject = [#{@value_type} buildWithDictionary:objInArray];\n"
      result << "  [temporaryCollection__ addObject:constructedObject];\n"
      result << "}\n"
      result
    end

    def from_dictionary_dictionary(dict_str)
      return "" if BUILTIN.include?(@value_type)

      result =  "NSMutableDictionary *temporaryCollection__ = [NSMutableDictionary dictionary];\n"
      result << "for (id<NSCopying> keyInDict in [#{dict_str} objectForKey:@\"#{@json_key}\"]) {\n"
      result << "  id valueForKeyInDict = [[#{dict_str} objectForKey:@\"#{@json_key}\"] objectForKey:keyInDict];"
      result << "  #{@value_type} constructedObject = [#{@value_type} buildWithDictionary:valueForKeyInDict];\n"
      result << "  [temporaryCollection__ setObject:constructedObject forKey:keyInDict];\n"
      result << "}\n"
      result
    end

    private
      def camel_to_snake(str)
        parts = [""]
        str.each_char do |c|
          if c > 'Z' # if lowercase
            parts[-1] << c
          else
            parts << c
          end
        end
        parts.reject!(&:empty?) # in case the first char was capital
        parts.map(&:downcase).join("_")
      end
  end
end
