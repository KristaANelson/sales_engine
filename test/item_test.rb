# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'item'
require 'pry'

class ItemTest < Minitest::Test
  attr_reader :item, :parent
  def setup
    row = {id: "1",
          name: "Item Qui Esse",
          description: "Nihil autem sit odio inventore deleniti.",
          unit_price: "75107",
          merchant_id: "1",
          created_at: "2012-03-27 14:53:59 UTC",
          updated_at: "2012-03-27 14:53:59 UTC"}

    @parent = Minitest::Mock.new
    @item = Item.new(row, parent)
  end

  def test_item_class_has_id_attribute
    assert_equal 1, item.id
  end
  def test_item_class_has_name_attribute
    assert_equal "Item Qui Esse", item.name
  end

  def test_item_class_has_description_attribute
    assert_equal "Nihil autem sit odio inventore deleniti.", item.description
  end

  def test_item_has_merchant_in
    assert_equal 1, item.merchant_id
  end

  def test_item_class_has_unit_price_attribute
    assert_equal BigDecimal.new("751.07"), item.unit_price
  end

  def test_item_class_has_status_attribute
    assert_equal 1, item.merchant_id
  end

  def test_item_class_has_created_at_attribute
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), item.created_at
  end

  def test_item_class_has_updated_at_attribute
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), item.updated_at
  end

  def test_it_delegates_invoice_items_method_to_its_parent
    parent.expect(:find_invoice_items_using_item_id, nil, [1])
    item.invoice_items
    parent.verify
  end

  def test_it_delegates_merchant_method_to_its_parent
    parent.expect(:find_merchant_using_merchant_id, nil, [1])
    item.merchant
    parent.verify
  end
end
