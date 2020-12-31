require 'minitest/autorun'
require 'minitest/pride'
require './lib/terminal_io'

class MockTerminalIO
  include TerminalIO
end

class TerminalIOTest < Minitest::Test
  def setup
    @io = MockTerminalIO.new
  end

  def test_it_exists
    assert_instance_of MockTerminalIO, @io
  end

  def test_can_write_to_terminal
    # Write without a newline
    @io.write("No newline", trailing_newline: false)

    # Write with a newline
    @io.write("Hello world!")
  end

  def test_can_read_from_terminal
    # Get input on same line as prompt
    input1 = @io.prompt("Enter a number: ")

    # Get input on a new line with a leader
    # (Also demonstrate using a hash to call the prompt method)
    opts = {
      input_on_newline: true,
      newline_leader: "> "
    }
    input2 = @io.prompt("Enter a number: ", opts)

    # Get input on a new line without a leader
    input3 = @io.prompt("Enter a number: ", input_on_newline: true)

    assert_instance_of String, input1
    assert_instance_of String, input2
    assert_instance_of String, input3
  end

  def test_can_wrte_blank_lines
    # Can write a single blank line
    @io.blankline

    # Can write some number of blank lines
    @io.blankline(2)
  end
end
