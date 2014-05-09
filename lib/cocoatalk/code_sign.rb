require 'digest'

module Cocoatalk
  class CodeSign
    def initialize(version)
      @version = version
      yield self if block_given?
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
      "/// @generated @signature<<#{digest}>>"
    end
  end
end