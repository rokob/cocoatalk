require_relative 'generator'
require 'optparse'

options = {output: "output"}
OptionParser.new do |opts|
  opts.banner = "Usage: run.rb input-file [options]"

  opts.on("-o", "--output-dir DIR", "Specify output directory") do |v|
    options[:output] = v
  end
end.parse!

options[:input] = ARGV.first || 'test/files/test-schema.rb'

puts "Generating models with schema: #{options[:input]}"
Cocoatalk::Generator.new.generate(options)
