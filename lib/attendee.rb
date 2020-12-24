class Attendee
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

  attr_reader :id,
              :registered_date,
              :first_name,
              :last_name,
              :email_address,
              :phone_number,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(info)
    parse_attributes(info)
  end

  private

  def parse_attributes(info)
    @id = info[:id]
    @registered_date = info[:registered_date]
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email_address = info[:email_address]
    @phone_number = info[:phone_number]
    @street = info[:street]
    @city = info[:city]
    @state = info[:state]
    @zipcode = info[:zipcode]
  end
end
