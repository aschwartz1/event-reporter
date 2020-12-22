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

  def test_returns_nil_when_file_not_found
    contents = @loader.load_csv("does_not_exist.csv")

    assert_nil contents
  end

  def test_it_loads_a_file_by_default
    contents = @loader.load_csv

    assert_instance_of CSV, contents
  end
end
