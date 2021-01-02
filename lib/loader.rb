require './lib/csv_importer'
require './lib/attendee_list_builder'

class Loader
  include CSVImporter

  DIRECTIVES = [:load]

  # def run(command_string)
  #   # Validate string
  #   parsed_command = parse_command(command_string)

  #   # Pass command hash to run method
  #   execute(parsed_command)
  # end

  def execute(parsed_command)
    case parsed_command[:directive]
    when :load
      load(parsed_command[:arguments])
    else
      "Invalid directive"
    end
  end

  def parse_command(command_string)
    split_command = split_and_standardize(command_string)

    if valid_command?(split_command)
      command = split_command[0].to_sym
      directive = split_command[1].to_sym
      argument = split_command[2]

      # Create hash
      {
        command: command,
        directive: directive,
        arguments: [argument]
      }
    else
      nil
    end
  end


  def load(filename)
    # Load CSV
    csv = import(filename)

    # Create attendee list from the CSV
    # TODO remove this dependency -- inject? Make ALB a module so I can `include` it?
    attendee_list_builder = AttendeeListBuilder.new(csv)
    attendee_list_builder.create_attendee_list
  end

  def split_and_standardize(command_string)
    split_input = command_string.split

    split_input << "full_event_attendees.csv" if split_input.length == 1
    split_input.insert(1, "load")
    split_input
  end

  private

  def valid_command?(split_command)
    valid_length = validate_command_length(split_command)
    valid_directive = validate_command_directive(split_command)
    valid_arguments = validate_command_arguments(split_command)

    valid_length && valid_directive && valid_arguments
  end

  def validate_command_length(split_command)
    [2..3].include?(split_command.length)
  end

  def validate_command_directive(split_command)
    DIRECTIVES.include?(split_command[1])
  end

  def validate_command_arguments(split_command)
    arguments = get_command_arguments(split_command)

    return false unless arguments.length == 1
    return false unless arguments[0].match?(/\A.+\.(csv)\z/)
    true
  end

  def get_command_arguments(split_command)
    split_command.delete_if do |word|
      word == "load" || DIRECTIVES.include?(word.to_sym)
    end
  end
end
