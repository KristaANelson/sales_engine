# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'invoice'
require 'pry'


class InvoiceTest < Minitest::Test
  attr_reader :invoice,
              :parent

  def setup
    row = {
          id: "1",
          customer_id: "1",
          merchant_id: "26",
          status: "shipped",
          created_at: "2012-03-25 09:54:09 UTC",
          updated_at:"2012-03-25 09:54:09 UTC"
          }

    @parent = Minitest::Mock.new
    @invoice = Invoice.new(row, parent)
  end
  
  def test_invoice_item_class_has_id_attribute
    assert_equal 1, invoice.id
  end

  def test_invoice_item_class_has_customer_id_attribute
    assert_equal 1, invoice.customer_id
  end

  def test_invoice_item_class_has_merchant_id_attribute
    assert_equal 26, invoice.merchant_id
  end

  def test_invoice_item_class_has_status_attribute
    assert_equal "shipped", invoice.status
  end

  def test_invoice_item_class_has_created_at_attribute
    assert_equal Date.parse("2012-03-25 09:54:09 UTC"), invoice.created_at
  end

  def test_invoice_item_class_has_updated_at_attribute
    assert_equal Date.parse("2012-03-25 09:54:09 UTC"), invoice.updated_at
  end

  def test_it_delegates_transactions_method_to_its_parent
    parent.expect(:find_transactions_using_id, nil, [1])
    invoice.transactions
    parent.verify
  end

  def test_it_delegates_items_method_to_its_parent
    parent.expect(:find_items_using_id, nil, [1])
    invoice.items
    parent.verify
  end

  def test_it_delegates_customer_method_to_its_parent
    parent.expect(:find_customer_using_customer_id, nil, [1])
    invoice.customer
    parent.verify
  end

  def test_it_delegates_invoice_items_method_to_its_parent
    parent.expect(:find_invoice_items_using_invoice_id, nil, [1])
    invoice.invoice_items
    parent.verify
  end

  def test_it_delegates_invoice_items_method_to_its_parent
    parent.expect(:create_transaction, nil, [[], 1])
    invoice.charge([])
    parent.verify
  end
end
