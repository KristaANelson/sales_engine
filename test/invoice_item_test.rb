# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'invoice_item'

class InvoiceItemTest < Minitest::Test
  attr_reader :invoice_item, :parent
  def setup
    row ={
            id:           "1",
            item_id:      "453",
            invoice_id:	  "26",
            quantity:     "4",
            unit_price:   "13635",
            created_at:	  "2012-03-27 14:54:09 UTC",
            updated_at:	  "2012-03-27 14:54:09 UTC"
          }
    @parent = Minitest::Mock.new
    @invoice_item = InvoiceItem.new(row, parent)
  end

  def test_invoice_item_class_has_parent
    assert invoice_item.parent
  end

  def test_invoice_item_class_has_id_attribute
    assert_equal 1, invoice_item.id
  end

  def test_invoice_item_class_has_item_id_attribute
    assert_equal 453, invoice_item.item_id
  end

  def test_invoice_item_class_has_invoice_id_attribute
    assert_equal 26, invoice_item.invoice_id
  end

  def test_invoice_item_class_has_quantity_attribute
    assert_equal 4, invoice_item.quantity
  end

  def test_invoice_item_class_has_unit_price_attribute
    assert_equal BigDecimal.new("136.35"), invoice_item.unit_price
  end

  def test_invoice_item_class_has_created_at_attribute
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), invoice_item.created_at
  end

  def test_invoice_item_class_has_updated_at_attribute
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), invoice_item.updated_at
  end

  def test_it_delegates_item_method_to_its_parent
    parent.expect(:find_item_using, nil, [453])
    invoice_item.item
    parent.verify
  end

  def test_it_delegates_item_method_to_its_parent
    parent.expect(:find_invoice_using, nil, [26])
    invoice_item.invoice
    parent.verify
  end
end
