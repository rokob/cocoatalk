require_relative 'code_sign'
require_relative 'table'
require_relative 'types'

module Cocoatalk
  class Generator
    def self.version
      "#{Table.version}::0.0.3"
    end

    def initialize(prefix="RK", language="objc")
      @prefix = prefix
      @language = language
      @tables = []
      @type_store = TypeStore.new
    end

    def create_table(name, options={})
      options = {language: @language}.merge options
      table = Table.new(name, @type_store, options)
      yield table
      @tables << table
    end

    def add_index(table_name, keys, options={})
    end

    def generate(options)
      open(options[:input]) do |f|
        lines = f.readlines.join("\n")
        @signer = CodeSign.new(Generator.version) do |signer|
          signer.add_content(lines)
        end
        instance_eval(lines)
        run_generator(options[:output], options[:language] || Types::Language::OBJC)
      end
    end

    private
      def run_generator(output, language)
        @tables.each do |t|
          t.build @prefix, @signer.signature
          base_filename = "#{output}/#{t.name(@prefix)}"
          if language == Types::Language::OBJC
            create_file(base_filename, ".h") { t.interface }
            create_file(base_filename, ".m") { t.implementation }
          else
            create_file(base_filename, ".swift") { t.swifty }
          end
        end
      end

      def create_file(filename, extension)
        open(filename + extension, 'w') do |f|
          f.puts yield
        end
      end
  end
end
