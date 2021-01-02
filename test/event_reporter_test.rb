require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test
  def setup
    @reporter = EventReporter.new
  end

  def test_it_exists
    assert_instance_of EventReporter, @reporter
  end

  def test_can_split_on_space
    result = @reporter.parse("queue print by last_name")

    assert_instance_of Array, result
    assert_equal 4, result.length
  end

  def test_can_determine_which_command_to_use
    assert_equal :queuer, @reporter.find_command("queue print by last_name")
    assert_equal :finder, @reporter.find_command("find first_name slartibartfast")
  end
end
