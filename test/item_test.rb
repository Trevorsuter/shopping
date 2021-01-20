require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/item'

class TestItem < MiniTest::Test

  def setup
    @item = Item.new({name: 'Peach', price: "$0.75"})
  end

  def test_it_exists_with_attributes
    assert_instance_of Item, @item
    assert_equal 'Peach', @item.name
    assert_equal 0.75, @item.price
  end
end