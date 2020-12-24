require './lib/attendee'
require './lib/csv_importer'

class AttendeeListBuilder
  include CSVImporter

  attr_reader :original_csv

  def initialize(filename)
    @original_csv = load_csv(filename)
  end

  def create_attendee_list
    @original_csv.map do |row|
      info = {}

      info[:id] = row[csv_keys[:id]]
      info[:registered_date] = row[csv_keys[:registered_date]]
      info[:first_name] = row[csv_keys[:first_name]]
      info[:last_name] = row[csv_keys[:last_name]]
      info[:email_address] = row[csv_keys[:email_address]]
      info[:phone_number] = row[csv_keys[:phone_number]]
      info[:street] = row[csv_keys[:street]]
      info[:city] = row[csv_keys[:city]]
      info[:state] = row[csv_keys[:state]]
      info[:zipcode] = row[csv_keys[:zipcode]]

      build_attendee(info)
    end
  end

  def build_attendee(info)
    Attendee.new(info)
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_number(phone_number)
    # Strip any non-number characters
    result = phone_number.tr("^0-9", "")

    # Enforce 10 digit phone numbers
    if result.length != 10
      "0000000000"
    else
      result
    end
  end

  private

  def csv_keys
    @csv_keys ||= {
      id: :id,
      registered_date: :regdate,
      first_name: :first_name,
      last_name: :last_name,
      email_address: :email_address,
      phone_number: :homephone,
      street: :street,
      city: :city,
      state: :state,
      zipcode: :zipcode
    }
  end

  def load_csv(filename)
    import(filename)
  end
end
