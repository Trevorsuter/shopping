class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, amount)
    @inventory[item] = amount
  end

  def check_stock(item)
    if @inventory[item] == nil
      0
    else
      @inventory[item]
    end
  end

  def potential_revenue
    @inventory.map do |key, value|
      key.price * value
    end.sum
  end

  def list_inventory_item_names
    @inventory.map do |key, value|
      key.name
    end.sort
  end

  def inventory_items_without_price
    @inventory.keys
  end
end