require 'minitest/autorun'
require 'minitest/pride'
require './lib/loader'

class LoaderTest < Minitest::Test
  def setup
    @loader = Loader.new
  end

  def test_it_exists
    assert_instance_of Loader, @loader
  end

  def test_can_parse_command_string
    good_input = "load"
    bad_input = "load not_a_filename"

    good_expected = {
      command: :load,
      directive: :load,
      arguments: ["full_event_attendees.csv"]
    }

    assert_equal good_expected, @loader.parse_command(good_input)
    assert_nil @loader.parse_command(bad_input)
  end

  def test_can_generate_attendees_from_csv
    attendee_list = @loader.load("test_good_data.csv")

    assert_equal 1, attendee_list.length
    assert_equal true, attendee_list.all? { |item| item.is_a? Attendee }
  end

  def test_can_standardize_command_input
    implicit_filename_input = "load"
    explicit_filename_input = "load foo.csv"

    implicit_expected = ["load", "load", "full_event_attendees.csv"]
    explicit_expected = ["load", "load", "foo.csv"]

    assert_equal implicit_expected, @loader.split_and_standardize(implicit_filename_input)
    assert_equal explicit_expected, @loader.split_and_standardize(explicit_filename_input)
  end

  def test_can_execute
    # create a valid parsed command (hash)
    parsed_command = {
      command: :load,
      directive: :load,
      arguments: ["full_event_attendees.csv"]
    }
    # pass to method, make sure it works
    attendee_list = @loader.execute(parsed_command)

    # make sure it also returns error string if directive is invalid
    assert_instance_of Array, attendee_list
    assert_equal true, attendee_list.all? { |obj| obj.is_a? Attendee }
  end
end
