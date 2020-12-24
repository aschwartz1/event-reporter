require 'minitest/autorun'
require 'minitest/pride'
require './lib/csv_importer'

class MockImporter
  include CSVImporter
end

class CSVImporterTest < Minitest::Test
  def setup
    @importer = MockImporter.new
  end

  def test_it_exists
    assert_instance_of MockImporter, @importer
  end

  def test_returns_nil_when_file_not_found
    contents = @importer.import("does_not_exist.csv")

    assert_nil contents
  end

  def test_it_loads_a_file_by_default
    contents = @importer.import

    assert_instance_of CSV, contents
  end

  def test_it_can_load_by_filename
    contents = @importer.import("full_event_attendees.csv")

    assert_instance_of CSV, contents
  end
end
