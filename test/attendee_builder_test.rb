require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee_builder'

class AttendeeBuilderTest < Minitest::Test
  def test_it_exists
    builder = AttendeeBuilder.new("test_good_data.csv")

    assert_instance_of AttendeeBuilder, builder
  end

  # can clean phone number
  def test_can_clean_phone_number
    builder = AttendeeBuilder.new("foo.csv")

    assert_equal "0000000000", builder.clean_phone_number("9.82E+00")
    assert_equal "1234567890", builder.clean_phone_number("123-456-7890")
  end

  # can clean zipcode
  def test_can_clean_zipcode
    builder = AttendeeBuilder.new("foo.csv")

    assert_equal "00123", builder.clean_zipcode("123")
  end
end

# Columns in the csv
#   id
#   reg_date
#   first_name
#   last_name
#   email_address
#   home_phone
#   street
#   city
#   state
#   zipcode
