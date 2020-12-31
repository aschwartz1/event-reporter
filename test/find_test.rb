require 'minitest/autorun'
require 'minitest/pride'
require './lib/find.rb'

class FindTest < Minitest::Test
  def setup
    @find = Find.new
  end

  def test_it_exists
    assert_instance_of Find, @find
  end

  def test_it_finds_stuff
  end
end
