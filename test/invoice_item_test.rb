require_relative 'test_helper'
require 'invoice_item'

class InvoiceItemTest < Minitest::Test
  def test_invoice_item_class_has_id_attribute
    invoice_item = InvoiceItem.new({:id => '1'}, "")
    assert_equal "1", invoice_item.id
  end

  def test_invoice_item_class_has_item_id_attribute
    invoice_item = InvoiceItem.new({:item_id => "539"}, "")
    assert_equal "539", invoice_item.item_id
  end

  def test_invoice_item_class_has_invoice_id_attribute
    invoice_item = InvoiceItem.new({:invoice_id => '1'}, "")
    assert_equal "1", invoice_item.invoice_id
  end

  def test_invoice_item_class_has_quantity_attribute
    invoice_item = InvoiceItem.new({:quantity => "5"}, "")
    assert_equal "5", invoice_item.quantity
  end

  def test_invoice_item_class_has_unit_price_attribute
    invoice_item = InvoiceItem.new({:unit_price => "13635"}, "")
    assert_equal "13635", invoice_item.unit_price
  end

  def test_invoice_item_class_has_created_at_attribute
    invoice_item = InvoiceItem.new({:created_at => "2012-03-27 14:54:09 UTC"}, "")
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_invoice_item_class_has_updated_at_attribute
    invoice_item = InvoiceItem.new({:updated_at => "2012-03-27 14:54:09 UTC"}, "")
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end
end
