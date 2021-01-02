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

  def test_can_generate_attendees_from_csv
    attendee_list = @loader.load("test_good_data.csv")

    assert_equal 1, attendee_list.length
    assert_equal true, attendee_list.all? { |item| item.is_a? Attendee }
  end
end
