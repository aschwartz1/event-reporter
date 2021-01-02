require './lib/csv_importer'
require './lib/attendee_list_builder'

class Loader
  include CSVImporter

  def load(filename)
    # Load CSV
    csv = import(filename)

    # Create attendee list from the CSV
    # TODO remove this dependency -- inject? Make ALB a module so I can `include` it?
    attendee_list_builder = AttendeeListBuilder.new(csv)
    attendee_list_builder.create_attendee_list
  end
end
