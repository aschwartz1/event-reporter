require 'minitest/autorun'
require 'minitest/pride'
require './lib/find.rb'
require './lib/csv_loader.rb'

class FindTest < Minitest::Test
  def setup
    @find = Find.new
    @loader = CSVLoader.new
  end

  def test_it_exists
    assert_instance_of Find, @find
  end

  def test_it_finds_stuff
    csv_array = @loader.load("full_event_attendees.csv")

    found_records = @find.find(csv_array, :zipcode, "20011")

    assert_instance_of Array, found_records
    assert_equal true, found_records.all? { |row| row.is_a? CSV::Row }
  end
end
