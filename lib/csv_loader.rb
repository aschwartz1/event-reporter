require 'csv'

class CSVLoader
  def load(filename="full_event_attendees.csv")
    read_to_array(filename) if file_exists?(filename)
  end

  private

  def read_to_array(filename)
    contents = []

    CSV.foreach(filename, csv_options) do |row|
      contents << row
    end

    contents
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
