require_relative 'test_helper'

describe 'Cocoatalk::Property' do
  describe "camel_to_snake" do
    let(:property) { Cocoatalk::Property.new('a','b','c') }

    it "should not change a snake_case string" do
      s = 'snake_case_string'
      result = property.camel_to_snake(s)
      result.must_equal s
    end

    it "should work if the first char is capitalized" do
      s = 'MyCamelString'
      result = property.camel_to_snake(s)
      result.must_equal 'my_camel_string'
    end

    it "should work if the first char is lowercase" do
      s = 'myCamelString'
      result = property.camel_to_snake(s)
      result.must_equal 'my_camel_string'
    end

    it "should work with non-alphabetic characters" do
      s = 'myCamel43String'
      result = property.camel_to_snake(s)
      result.must_equal 'my_camel43_string'
    end
  end
end