module TerminalIO
  def write(message, trailing_newline: true)
    if trailing_newline
      puts message
    else
      print message
    end
  end

  def prompt(message, input_on_newline: false, newline_leader: "")
    if input_on_newline
      puts message
      print newline_leader
    else
      print message
    end

    gets.chomp
  end

  def blankline(number=1)
    number.times do
      puts ""
    end
  end
end
