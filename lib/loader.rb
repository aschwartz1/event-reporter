require 'csv'

class Loader
  def load_csv(filename)
    CSV.open filename, csv_options
  end

  private

  def csv_options
    {
      headers: true,
      header_converters: :symbol
    }
  end
end
