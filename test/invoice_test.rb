require_relative 'test_helper'
require 'invoice'

class InvoiceTest < Minitest::Test
  def test_invoice_item_class_has_id_attribute
    row = {id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(row, '')
    assert_equal "1", invoice.id
  end

  def test_invoice_item_class_has_customer_id_attribute
    row = {id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"}
        invoice = Invoice.new(row, '')
    assert_equal "1", invoice.customer_id
  end

  def test_invoice_item_class_has_merchant_id_attribute
    row = {id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(row, '')
    assert_equal "26", invoice.merchant_id
  end

  def test_invoice_item_class_has_status_attribute
    row = {id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(row, '')
    assert_equal "shipped", invoice.status
  end

  def test_invoice_item_class_has_created_at_attribute
    row = {id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(row, '')
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_invoice_item_class_has_updated_at_attribute
    row = {id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(row, '')
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end
end
