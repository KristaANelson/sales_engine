require_relative 'test_helper'
require 'item'

class ItemTest < Minitest::Test
  def test_item_class_has_id_attribute
    row = {id: "1",
           name: "Item Qui Esse",
           description: "Nihil autem sit odio inventore deleniti.",
           unit_price: "75107",
           merchant_id: "1",
           created_at: "2012-03-27 14:53:59 UTC",
           updated_at: "2012-03-27 14:53:59 UTC"}
    item = Item.new(row)
    assert_equal "1", item.id
  end

  def test_item_class_has_description_attribute
    row = {id: "1",
          name: "Item Qui Esse",
          description: "Nihil autem sit odio inventore deleniti.",
          unit_price: "75107",
          merchant_id: "1",
          created_at: "2012-03-27 14:53:59 UTC",
          updated_at: "2012-03-27 14:53:59 UTC"}
        item = Item.new(row)
    assert_equal "Nihil autem sit odio inventore deleniti.", item.description
  end

  def test_item_class_has_merchant_id_attribute
    row = {id: "1",
          name: "Item Qui Esse",
          description: "Nihil autem sit odio inventore deleniti.",
          unit_price: "75107",
          merchant_id: "1",
          created_at: "2012-03-27 14:53:59 UTC",
          updated_at: "2012-03-27 14:53:59 UTC"}
    item = Item.new(row)
    assert_equal "75107", item.unit_price
  end

  def test_item_class_has_status_attribute
    row = {id: "1",
          name: "Item Qui Esse",
          description: "Nihil autem sit odio inventore deleniti.",
          unit_price: "75107",
          merchant_id: "1",
          created_at: "2012-03-27 14:53:59 UTC",
          updated_at: "2012-03-27 14:53:59 UTC"}
    item = Item.new(row)
    assert_equal "1", item.merchant_id
  end

  def test_item_class_has_created_at_attribute
    row = {id: "1",
          name: "Item Qui Esse",
          description: "Nihil autem sit odio inventore deleniti.",
          unit_price: "75107",
          merchant_id: "1",
          created_at: "2012-03-27 14:53:59 UTC",
          updated_at: "2012-03-27 14:53:59 UTC"}
    item = Item.new(row)
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_item_class_has_updated_at_attribute
    row = {id: "1",
          name: "Item Qui Esse",
          description: "Nihil autem sit odio inventore deleniti.",
          unit_price: "75107",
          merchant_id: "1",
          created_at: "2012-03-27 14:53:59 UTC",
          updated_at: "2012-03-27 14:53:59 UTC"}
    item = Item.new(row)
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end
end
