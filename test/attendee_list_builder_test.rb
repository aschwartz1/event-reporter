require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee_list_builder'
require './lib/attendee'

class AttendeeListBuilderTest < Minitest::Test
  def test_it_exists
    builder = AttendeeListBuilder.new("test_good_data.csv")

    assert_instance_of AttendeeListBuilder, builder
  end

  def test_can_create_an_array_of_attendees
    builder = AttendeeListBuilder.new("test_good_data.csv")

    attendees = builder.create_attendee_list

    assert_instance_of Array, attendees
    assert_equal 1, attendees.length
    assert_equal "Allison", attendees[0].first_name
    assert_equal "6154385000", attendees[0].phone_number
    assert_equal "20010", attendees[0].zipcode
  end

  def test_can_create_an_attendee
    builder = AttendeeListBuilder.new("foo.csv")
    info = {
      id: 1,
      registered_date: "11/12/08 10:47",
      first_name: "Allison",
      last_name: "Nguyen",
      email_address: "arannon@jumpstartlab.com",
      phone_number: "6154385000",
      street: "3155 19th St NW",
      city: "Washington",
      state: "DC",
      zipcode: "20010"
    }

    attendee = builder.build_attendee(info)

    assert_instance_of Attendee, attendee
    assert_equal "Allison", attendee.first_name
    assert_equal "6154385000", attendee.phone_number
    assert_equal "20010", attendee.zipcode
  end

  def test_it_reads_csv_when_created
    filename = "test_good_data.csv"
    builder = AttendeeListBuilder.new(filename)

    assert_instance_of CSV, builder.original_csv
  end

  def test_can_clean_phone_number
    builder = AttendeeListBuilder.new("foo.csv")

    assert_equal "0000000000", builder.clean_phone_number("9.82E+00")
    assert_equal "1234567890", builder.clean_phone_number("123-456-7890")
  end

  def test_can_clean_zipcode
    builder = AttendeeListBuilder.new("foo.csv")

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
