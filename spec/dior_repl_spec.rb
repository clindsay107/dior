require 'spec_helper'
require 'dior/repl'

describe Dior::Repl do

  describe "starting and stopping" do
    before do
      @input = StringIO.new("exit")
      @output = StringIO.new
      @repl = Dior::Repl.new(@input, @output)
    end

    it "should be able to start (with prompt) and exit from the repl" do
      @repl.start
      @output.string.must_match(/A command line music thing/)
    end
  end

  describe "accessing help" do
    before do
      @input = MockIO.new(["help", "exit"])
      @output = StringIO.new
      @repl = Dior::Repl.new(@input, @output)
    end

    it "should display help the menu on help command" do
      @repl.start
      @output.string.must_match(/This will provide help/)
    end
  end

end

# Super simple helper class to test our REPL.
# Always supplies 'exit' command once buffer is exhausted.
# Buffer is an array of string commands to be passed as input to the REPL
class MockIO
  def initialize(buffer = [])
    @buffer = buffer
  end

  def gets
    @buffer.empty? ? "exit" : @buffer.shift
  end
end
