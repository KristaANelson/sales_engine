# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'
require 'invoice_repository'
require 'csv'

class InvoiceRepoTest <Minitest::Test

  attr_reader :data,
              :parent,
              :invoice_repository,
              :filepath
  def setup
    @filepath = File.expand_path('../../test_data',  __FILE__)
    @data = CSV.open("#{filepath}/test_invoices.csv", headers: true, header_converters: :symbol)
    @parent = Minitest::Mock.new
    @invoice_repository = InvoiceRepository.new(parent, data)
  end

  def test_find_transactions_using_id_goes_to_sales_engine
    parent.expect(:find_transcations_using_invoice, nil, [1])
    invoice_repository.find_transactions_using_id(1)
    parent.verify
  end

  def test_find_items_using_invoice_goes_to_sales_engine
    parent.expect(:find_items_using_invoice, nil, [5])
    invoice_repository.find_items_using_id(5)
    parent.verify
  end

  def test_find_customer_using_customer_id_goes_to_sales_engine
    parent.expect(:find_customer_using_customer_id, nil, [5])
    invoice_repository.find_customer_using_customer_id(5)
    parent.verify
  end

  def test_find_customer_using_customer_id_goes_to_sales_engine
    parent.expect(:find_invoice_items_using_invoice_id, nil, [5])
    invoice_repository.find_invoice_items_using_invoice_id(5)
    parent.verify
  end

  def test_new_invoice_item_id_creates_next_id
    assert_equal 11, invoice_repository.new_id
  end

  def test_create_goes_to_sales_engine
    parent.expect(:create_transaction, nil, [[],5])
    invoice_repository.create_transaction([],5)
    parent.verify
  end

  def test_find_by_id_returns_1_invoice
    assert_equal 1, invoice_repository.find_by_id(1).customer_id
  end

  def test_find_by_id_returns_invoice_item_object
    assert_equal Invoice, invoice_repository.find_by_id(1).class
  end

  def test_find_by_id_finds_correct_invoice_item
    assert_equal 1, invoice_repository.find_by_id(1).customer_id
  end

  def test_find_by_id_returns_nil_if_no_such_id
    assert_equal  nil , invoice_repository.find_by_id(4567)
  end

  def test_find_all_by_customer_id_returns_collection_of_items
    assert_equal 1, invoice_repository.find_all_by_customer_id(1)[0].id
    assert_equal 2, invoice_repository.find_all_by_customer_id(1)[1].id
    assert_equal 8, invoice_repository.find_all_by_customer_id(1).size
  end

  def test_find_all_by_customer_id_returns_empty_array_if_no_customer_id_presnt
    assert_equal  [] , invoice_repository.find_all_by_customer_id(456)
  end

  def test_find_all_by_customer_id_returns_array_of_invoice_items
    assert_equal Invoice, invoice_repository.find_all_by_customer_id(1)[0].class
  end

  def test_find_by_merchant_id_returns_invoice_item
    assert_equal Invoice, invoice_repository.find_by_merchant_id(26).class
  end

  def test_find_by_status_returns_1_invoice
    assert [1,2,3,4,5,6,7,8, 9,10].include?(invoice_repository.find_by_status("shipped").id)
  end

  def test_find_by_customer_id_returns_nil_if_no_such_cust
    assert_equal  nil  , invoice_repository.find_by_customer_id(4567)
  end

  def test_find_all_by_merchant_id_returns_collection
    assert_equal 1, invoice_repository.find_all_by_merchant_id(26).count
  end

  def test_find_all_by_created_at_date
    assert_equal 3, invoice_repository.find_all_by_created_at(Date.parse('2012-03-07 21:54:10 UTC')).count
    assert_equal [], invoice_repository.find_all_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_created_at_date
    assert_equal Invoice, invoice_repository.find_by_created_at(Date.parse('2012-03-25 09:54:09 UTC')).class
    assert_equal nil, invoice_repository.find_by_created_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_all_by_updated_at_date
    assert_equal 3, invoice_repository.find_all_by_updated_at(Date.parse('2012-03-07 21:54:10 UTC')).count
    assert_equal [], invoice_repository.find_all_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end

  def test_find_by_updated_at_date
    assert_equal Invoice, invoice_repository.find_by_updated_at(Date.parse('2012-03-25 09:54:09 UTC')).class
    assert_equal nil, invoice_repository.find_by_updated_at(Date.parse('2012-04-27 14:54:09 UTC'))
  end
end
