module Cocoatalk
  module ExecutionHelpers
    def upcase_first(str)
      str[0].upcase + str[1..-1]
    end

    def snake2camel(str)
      parts = str.split('_')
      [parts[0], parts[1..-1].map(&:capitalize)].join("")
    end
  end
end