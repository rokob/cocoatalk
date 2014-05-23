module Cocoatalk
  class Property

    attr_reader :name, :memory, :primative

    BUILTIN = %w{ NSInteger NSUInteger NSString NSTimeInterval NSDate BOOL CGFloat NSArray NSDictionary }

    def initialize(name, memory, base_type, options={})
      default_options = {
        primative: false,
        indirection: nil,
        collection: false,
        value_type: nil
      }
      options = default_options.merge options
      @name = name
      @memory = memory
      @base_type = base_type
      @builtin = BUILTIN.include?(base_type)
      @primative = options[:primative]
      @indirection = options[:indirection] || (options[:primative] ? 0 : 1)
      @collection = options[:collection]
      @value_type = options[:value_type]
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
        "(NSUInteger)(_#{@name})"
      else
        "[_#{@name} hash]"
      end
    end

    def coder_type_string
      return "Object" unless @primative
      case @base_type
      when "NSInteger"
        "Integer"
      when "BOOL"
        "Bool"
      when "CGFloat"
        "Float"
      else
        "Object" # this shouldn't happen
      end
    end

    def json_key
      camel_to_snake(@name)
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
