require 'minitest/autorun'
require 'minitest/pride'
require './lib/csv_loader'

class CSVLoaderTest < Minitest::Test
  def setup
    @loader = CSVLoader.new
  end

  def test_it_exists
    assert_instance_of CSVLoader, @loader
  end

  def test_returns_nil_when_file_not_found
    contents = @loader.load("does_not_exist.csv")

    assert_nil contents
  end

  def test_it_loads_a_file_by_default
    contents = @loader.load

    assert_instance_of Array, contents
    assert_equal true, contents.all? { |row| row.is_a? CSV::Row }
  end

  def test_it_can_load_by_filename
    contents = @loader.load("full_event_attendees.csv")

    assert_instance_of Array, contents
    assert_equal true, contents.all? { |row| row.is_a? CSV::Row }
  end
end
