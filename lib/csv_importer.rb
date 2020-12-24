require 'csv'

module CSVImporter
  def import(filename="full_event_attendees.csv")
    open(filename) if file_exists?(filename)
  end

  private

  def open(filename)
    CSV.open filename, csv_options
  end

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
