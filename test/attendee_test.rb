require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'

class AttendeeTest < Minitest::Test
  def setup
    @info = {
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

    @attendee = Attendee.new(@info)
  end

  def test_it_exists
    assert_instance_of Attendee, @attendee
  end

  def test_readable_attributes
    assert_equal @info[:id], @attendee.id
    assert_equal @info[:registered_date], @attendee.registered_date
    assert_equal @info[:first_name], @attendee.first_name
    assert_equal @info[:last_name], @attendee.last_name
    assert_equal @info[:email_address], @attendee.email_address
    assert_equal @info[:phone_number], @attendee.phone_number
    assert_equal @info[:street], @attendee.street
    assert_equal @info[:city], @attendee.city
    assert_equal @info[:state], @attendee.state
    assert_equal @info[:zipcode], @attendee.zipcode
  end
end
