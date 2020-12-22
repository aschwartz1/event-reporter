require 'csv'

class Loader
  def load_csv(filename="full_event_attendees.csv")
    CSV.open filename, csv_options if file_exists?(filename)
  end

  private

  def file_exists?(filename)
    File.file?(filename)
  end

  def csv_options
    {
      headers: true,
      header_converters: :symbol
    }
  end
end
