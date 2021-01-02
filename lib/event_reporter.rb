require './lib/loader'
require './lib/queuer'
require './lib/finder'

class EventReporter
  INPUT_TO_COMMAND = {
    "load"    => :loader,
    "queue"   => :queuer,
    "find"    => :finder
    # "help"    => Helper
  }

  def find_command(command)
    INPUT_TO_COMMAND[parse(command)[0]]
  end

  def parse(command)
    command.split
  end
end
