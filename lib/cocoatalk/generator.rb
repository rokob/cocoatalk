require 'digest'

module Cocoatalk
  class Generator
    def self.version
      "#{Table.version}::0.0.1"
    end

    def initialize(prefix="RK")
      @prefix = prefix
      @tables = []
    end

    def create_table(name, options={})
      table = Table.new(name)
      yield table
      @tables << table
    end

    def add_index(table_name, keys, options={})
    end

    def generate(options)
      open(options[:input]) do |f|
        lines = f.readlines.join("\n")
        @signer = CodeSign.new(Generator.version) { |g| g.add_content(lines) }
        self.instance_eval(lines)
        run_generator(options[:output])
      end
    end

    private
      def run_generator(output)
        @tables.each do |t|
          base_filename = "#{output}/#{t.name(@prefix)}"
          create_file(base_filename, ".h") { t.interface(@prefix) }
          create_file(base_filename, ".m") { t.implementation(@prefix) }
        end
      end

      def create_file(filename, extension)
        open(filename + extension, 'w') do |f|
          f.puts @signer.signature
          f.puts yield
        end
      end
  end

  class CodeSign
    def initialize(version)
      @version = version
      yield self
    end

    def add_content(content)
      @content ||= ""
      @content += content
    end

    def signature
      signature_comment(digestive(@version + @content))
    end

    def digestive(str)
      Digest::MD5.hexdigest(str)
    end

    def signature_comment(digest)
      "/// @generated @signature<<#{digest}>>\n\n"
    end
  end

  class NameConverter
    class << self
      def snake_to_camel(str, capitalize_first: false)
        s = str.split("_").map(&:capitalize)
        s[0] = s[0].downcase unless capitalize_first
        s.join("")
     end
    end
  end

  class Value
    def self.version
      '0.0.1'
    end

    def initialize(name)
      @name = name
      @fields = []
    end

    def add_field(type, name, memory)
      @fields << {type: type, name: name, memory: memory}
    end

    def interface(prefix)
      name, mutableName = names(prefix)

      s  = "#include <Foundation/Foundation.h>\n\n";
      s += "@class #{mutableName};\n\n"
      s += immutable_interface(name, mutableName)
      s += "\n\n"
      s += mutable_interface(name, mutableName)
      s += "\n"
      s
    end

    def implementation(prefix)
      name, mutableName = names(prefix)

      s  = "#include \"#{name}.h\"\n\n"
      s += immutable_implementation(name, mutableName)
      s += "\n\n"
      s += mutable_implementation(name, mutableName)
      s += "\n"
      s
    end

    private
      def names(prefix)
        name = prefix + @name
        mutableName = "#{prefix}Mutable#{@name}"
        [name, mutableName]
      end

      def immutable_interface(name, mutableName)
        s  = "@interface #{name} : NSObject\n\n"
        s += "+ (instancetype)build:(void(^)(#{mutableName}*))block;\n"
        s += "+ (instancetype)buildWithObject:(#{name}*)object block:(void(^)(#{mutableName}*))block;\n\n"
        s += properties
        s += "\n@end"
        s
      end

      def mutable_interface(name, mutableName)
        s  = "@interface #{mutableName} : NSObject\n\n"
        s += "- (instancetype)initWithImmutableObject:(#{name} *)immutableObject;\n"
        s += "- (#{name}*)makeImmutable;\n\n"
        s += properties(readonly: false)
        s += "\n@end"
        s
      end

      def properties(readonly: true)
        s = ""
        @fields.each do |field|
          name = NameConverter.snake_to_camel(field[:name])
          access = readonly ? "readonly" : "readwrite"
          qualifiers = "(nonatomic, #{access}, #{field[:memory]})"
          s += "@property #{qualifiers} #{field[:type]} #{name};\n"
        end
        s
      end

      def immutable_implementation(name, mutableName)
        s  = "@implementation #{name}\n\n"
        s += immutable_init
        s += "\n\n"
        s += generic_immutable_builder_implementation(name, mutableName)
        s += "\n\n"
        s += immutable_builder_implementation(name, mutableName)
        s += "\n\n@end"
        s
      end

      def immutable_init
        s  = "- (id)initWith"
        @fields.each_with_index do |field, idx|
          name = NameConverter.snake_to_camel(field[:name], capitalize_first: idx==0)
          space = idx==0 ? "" : "      "
          variable_name = NameConverter.snake_to_camel(field[:name])
          method_keyword = space + "#{name}:(#{field[:type]})#{variable_name}\n"
          s += method_keyword
        end
        s += "{\n"
        s += "  if ((self = [super init])) {\n"
        @fields.each do |field|
          name = NameConverter.snake_to_camel(field[:name])
          s += "    self.#{name} = #{name};\n"
        end
        s += "  }\n"
        s += "  return self;\n"
        s += "}"
        s
      end

      def generic_immutable_builder_implementation(name, mutableName)
        s  = "+ (id)buildWithObject:(#{name}*)object block:(void(^)(#{mutableName}*))block\n{\n"
        s += "  #{mutableName}* mutableObject = [[#{mutableName} alloc] initWithImmutableObject:object];\n"
        s += "  if (block) {\n"
        s += "    block(mutableObject);\n"
        s += "  }\n"
        s += "  return [mutableObject makeImmutable];\n"
        s += "}"
        s
      end

      def immutable_builder_implementation(name, mutableName)
        s  = "+ (id)build:(void(^)(#{mutableName}*))block\n{\n"
        s += "  #{mutableName}* mutableObject = [[#{mutableName} alloc] init];\n"
        s += "  return [self buildWithObject:mutableObject block:block];\n"
        s += "}"
        s
      end

      def mutable_implementation(name, mutableName)
        s  = "@implementation #{mutableName}\n\n"
        s += mutable_init(name)
        s += "\n\n"
        s += make_immutable(name)
        s += "\n\n@end"
        s
      end

      def mutable_init(name)
        s  = "- (id)initWithImmutableObject:(#{name}*)immutableObject\n"
        s += "{\n"
        s += "  if ((self = [super init])) {\n"
        @fields.each do |field|
          name = NameConverter.snake_to_camel(field[:name])
          s += "    self.#{name} = immutableObject.#{name};\n"
        end
        s += "  }\n"
        s += "  return self;\n"
        s += "}"
        s
      end

      def make_immutable(name)
        s  = "- (#{name}*)makeImmutable;\n{\n"
        s += "  #{name}* object = [[#{name} alloc] initWith"
        @fields.each_with_index do |field, idx|
          name = NameConverter.snake_to_camel(field[:name], capitalize_first: idx==0)
          space = idx==0 ? "" : "      "
          variable_name = NameConverter.snake_to_camel(field[:name])
          method_keyword = space + "#{name}:self.#{variable_name}\n"
          s += method_keyword
        end
        s += "  ];\n"
        s += "  return object;\n"
        s += "}"
        s
      end
  end

  class Table
    def self.version
      "#{Value.version}::0.0.1"
    end

    def initialize(name)
      @name = NameConverter.snake_to_camel(name, capitalize_first: true)
      @value = Value.new(@name)
    end

    def integer(name, options={})
      @value.add_field("NSInteger", name, "assign")
    end

    def string(name, options={})
      @value.add_field("NSString*", name, "copy")
    end

    def datetime(name, options={})
      @value.add_field("NSTimeInterval", name, "assign")
    end

    def date(name, options={})
      @value.add_field("NSDate*", name, "strong")
    end

    def boolean(name, options={})
      @value.add_field("BOOL", name, "assign")
    end

    def text(name, options={})
      @value.add_field("NSString*", name, "copy")
    end

    def decimal(name, options={})
      @value.add_field("CGFloat", name, "assign")
    end

    def interface(prefix)
      @value.interface(prefix)
    end

    def implementation(prefix)
      @value.implementation(prefix)
    end

    def name(prefix)
      prefix + @name
    end

    private
      def to_class_name(str)
        str.split("_").map(&:capitalize).join("")
      end
  end
end
