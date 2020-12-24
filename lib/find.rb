class Find
  def find(csv_array, header_symbol, search_value)
    csv_array.select do |row|
      row[header_symbol] == search_value
    end
  end
end
