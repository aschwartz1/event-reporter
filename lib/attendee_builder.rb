class AttendeeBuilder
  def initialize(filename)

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
end
