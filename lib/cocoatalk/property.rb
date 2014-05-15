module Cocoatalk
  class Property
    attr_reader :name, :memory, :primative

    def initialize(name, memory, base_type, primative=false, indirection=nil)
      @name = name
      @memory = memory
      @base_type = base_type
      @primative = primative
      @indirection = indirection || (primative ? 0 : 1)
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
        "[_#{@name} isEqual:#{other}->_#{@name}]"
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

    def primative
      @indirection == 0
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
  end
end
