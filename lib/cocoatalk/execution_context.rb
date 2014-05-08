require_relative 'execution_helpers'

module Cocoatalk
  class ExecutionContext
    include ExecutionHelpers

    def initialize(hash)
      hash.each do |key, value|
        singleton_class.send(:define_method, key) { value }
      end
    end

    def get_binding
      binding
    end
  end
end