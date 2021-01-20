require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/item'
require './lib/vendor'

class TestVendor < MiniTest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists_with_attributes
    assert_instance_of Vendor, @vendor
    assert_equal 'Rocky Mountain Fresh', @vendor.name
    assert_equal Hash.new, @vendor.inventory
  end

  def test_it_can_stock_items
    @vendor.stock(@item1, 30)
    @vendor.stock(@item2, 20)
    expected = {@item1 => 30,
                @item2 => 20}
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_check_stock_of_item
    @vendor.stock(@item1, 30)
    assert_equal 0, @vendor.check_stock(@item2)
    assert_equal 30, @vendor.check_stock(@item1)
  end
end