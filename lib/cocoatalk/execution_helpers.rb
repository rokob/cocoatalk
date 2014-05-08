module Cocoatalk
  module ExecutionHelpers
    def upcase_first(str)
      str[0].upcase + str[1..-1]
    end
  end
end