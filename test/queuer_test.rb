require 'minitest/autorun'
require 'minitest/pride'
require './lib/queuer'

class QueuerTest < Minitest::Test
  def test_it_exists
    @queuer = Queuer.new
  end
end
