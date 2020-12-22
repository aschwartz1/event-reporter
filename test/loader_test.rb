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

  def test_it_loads_files
    contents = @loader.load_csv("full_event_attendees.csv")

    assert_instance_of CSV, contents
  end
end
