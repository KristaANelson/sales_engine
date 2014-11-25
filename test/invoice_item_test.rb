require_relative 'test_helper'
require 'invoice_item'

class InvoiceItemTest < Minitest::Test
  def test_invoice_item_class_has_id_attribute
    row = {id: "1",
           item_id: "539",
           invoice_id: "1",
           quantity: "5",
           unit_price: "13635",
           created_at: "2012-03-27 14:54:09 UTC",
           updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "1", invoice_item.id
  end

  def test_invoice_item_class_has_item_id_attribute
    row = {id: "1",
          item_id: "539",
          invoice_id: "1",
          quantity: "5",
          unit_price: "13635",
          created_at: "2012-03-27 14:54:09 UTC",
          updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "539", invoice_item.item_id
  end

  def test_invoice_item_class_has_invoice_id_attribute
    row = {id: "1",
          item_id: "539",
          invoice_id: "1",
          quantity: "5",
          unit_price: "13635",
          created_at: "2012-03-27 14:54:09 UTC",
          updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "1", invoice_item.invoice_id
  end

  def test_invoice_item_class_has_quantity_attribute
  row = {id: "1",
        item_id: "539",
        invoice_id: "1",
        quantity: "5",
        unit_price: "13635",
        created_at: "2012-03-27 14:54:09 UTC",
        updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "5", invoice_item.quantity
  end

  def test_invoice_item_class_has_unit_price_attribute
  row = {id: "1",
        item_id: "539",
        invoice_id: "1",
        quantity: "5",
        unit_price: "13635",
        created_at: "2012-03-27 14:54:09 UTC",
        updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "13635", invoice_item.unit_price
  end

  def test_invoice_item_class_has_created_at_attribute
  row = {id: "1",
        item_id: "539",
        invoice_id: "1",
        quantity: "5",
        unit_price: "13635",
        created_at: "2012-03-27 14:54:09 UTC",
        updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_invoice_item_class_has_updated_at_attribute
  row = {id: "1",
        item_id: "539",
        invoice_id: "1",
        quantity: "5",
        unit_price: "13635",
        created_at: "2012-03-27 14:54:09 UTC",
        updated_at: "2012-03-27 14:54:09 UTC"}
    invoice_item = InvoiceItem.new(row)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end
end
