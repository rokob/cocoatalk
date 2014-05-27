require_relative 'test_helper'

module CocoatalkTest
  class Execution
    include Cocoatalk::ExecutionHelpers
  end
end

describe 'Cocoatalk::ExecutionHelpers' do
  it "doesn't change a string with all caps" do
    s = 'ABCD'
    s.must_equal CocoatalkTest::Execution.new.upcase_first(s)
  end

  it "has the first letter uppercase" do
    s = 'abcd'
    result = CocoatalkTest::Execution.new.upcase_first(s)
    'A'.must_equal result[0]
  end

  it "doesn't change the rest of the string" do
    s = 'aBcD12'
    result = CocoatalkTest::Execution.new.upcase_first(s)
    s[1..-1].must_equal result[1..-1]
  end
end